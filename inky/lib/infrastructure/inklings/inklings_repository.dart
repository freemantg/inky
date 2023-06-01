import 'package:inky/domain/inklings/inkling.dart';
import 'package:dartz/dartz.dart';
import 'package:inky/domain/inklings/inklings_interface.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/inklings/inklings_local_service.dart';
import 'package:inky/infrastructure/tags/tag_dto.dart';
import 'package:inky/router.dart';

import '../../domain/tags/tag.dart';
import 'inkling_dto.dart';
import 'inklings_remote_service.dart';

class InklingsRepository implements InklingsInterface {
  final InklingLocalServices _localServices;
  final InklingRemoteService _remoteServices;

  InklingsRepository({
    required InklingLocalServices localServices,
    required InklingRemoteService remoteServices,
  })  : _localServices = localServices,
        _remoteServices = remoteServices;

  @override
  Future<Either<TagFailure, Unit>> create(Inkling inkling) async {
    try {
      await _localServices.insert(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToCreate());
    }
  }

  @override
  Future<Either<TagFailure, Unit>> delete(Inkling inkling) async {
    try {
      await _localServices.delete(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToDelete());
    }
  }

  @override
  Future<Either<TagFailure, List<Inkling>>> fetchInklings({
    List<Tag>? filter,
    InklingType? inklingType,
  }) async {
    try {
      final dtos = await _localServices.fetchInklings(
        filter: filter?.map((tag) => TagDto.fromDomain(tag)).toList(),
        inklingType: inklingType,
      );
      final inklings = dtos.map((e) => e.toDomain()).toList();
      final inklingsWithMetaData = await _insertMetaData(inklings);
      return right(inklingsWithMetaData);
    } catch (e) {
      return left(TagFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<TagFailure, Unit>> update(Inkling inkling) async {
    try {
      await _localServices.update(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToUpdate());
    }
  }

  @override
  Stream<Either<TagFailure, List<Inkling>>> watchInklings({
    List<Tag>? filter,
    InklingType? inklingType,
  }) {
    return _localServices
        .streamInklings(
      filter: filter?.map((tag) => TagDto.fromDomain(tag)).toList(),
      inklingType: inklingType,
    )
        .asyncExpand((inklingDtos) async* {
      // Convert the dto list to domain list
      final inklings = inklingDtos.map((e) => e.toDomain()).toList();
      try {
        // Insert metadata and yield the result
        final inklingsWithMetaData = await _insertMetaData(inklings);
        yield right(inklingsWithMetaData);
      } catch (e) {
        yield left(TagFailure.unexpected(message: e.toString()));
      }
    });
  }

  Future<List<Inkling>> _insertMetaData(List<Inkling> inklings) async {
    final List<Inkling> inklingsWithMetaData = [];

    for (final inkling in inklings) {
      if (inkling.link.isEmpty) {
        inklingsWithMetaData.add(inkling);
      } else {
        final metaData = await _remoteServices.fetchMetaData(inkling.link);
        final inklingWithMetaData = inkling.copyWith(
          metaData: metaData.fold(
            (l) => null,
            (metaData) => metaData,
          ),
        );
        inklingsWithMetaData.add(inklingWithMetaData);
      }
    }
    return inklingsWithMetaData;
  }
}
