import 'package:inky/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:inky/infrastructure/inklings/inklings_local_service.dart';
import 'package:inky/infrastructure/tags/tag_dto.dart';
import 'package:inky/router.dart';

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
  Future<Either<InklingFailure, Unit>> create(Inkling inkling) async {
    try {
      await _localServices.insert(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const InklingFailure.unableToCreate());
    }
  }

  @override
  Future<Either<InklingFailure, Unit>> delete(Inkling inkling) async {
    try {
      await _localServices.delete(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const InklingFailure.unableToDelete());
    }
  }

  @override
  Future<Either<InklingFailure, Unit>> update(Inkling inkling) async {
    try {
      await _localServices.update(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const InklingFailure.unableToUpdate());
    }
  }

  @override
  Stream<Either<InklingFailure, List<Inkling>>> watchInklings({
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
        yield left(InklingFailure.unexpected(message: e.toString()));
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
