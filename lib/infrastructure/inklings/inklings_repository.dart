import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../../router.dart';
import '../infrastructure.dart';

class InklingsRepository implements InklingsInterface {
  final InklingLocalServices _localServices;
  final InklingRemoteService _remoteServices;

  InklingsRepository({
    required InklingLocalServices localServices,
    required InklingRemoteService remoteServices,
  })  : _localServices = localServices,
        _remoteServices = remoteServices;

  @override
  Future<Either<InklingFailure, Unit>> upsert(Inkling inkling) async {
    try {
      await _localServices.upsert(InklingDto.fromDomain(inkling));
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
    // Convert each inkling to a future that completes when the metadata is fetched.
    var futures = inklings.map((inkling) async {
      if (inkling.link.isEmpty) {
        return inkling;
      } else {
        final metaDataOrFailure =
            await _remoteServices.fetchMetaData(inkling.link);
        final metaData = metaDataOrFailure.fold(
          (failure) => null,
          (metaData) => metaData,
        );
        return inkling.copyWith(metaData: metaData);
      }
    }).toList();
    // Wait for all futures to complete and return the results as a list.
    return Future.wait(futures);
  }
}
