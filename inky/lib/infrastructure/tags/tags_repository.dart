import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/domain/tags/tag.dart';
import 'package:dartz/dartz.dart';
import 'package:inky/domain/tags/tags_interface.dart';
import 'package:inky/infrastructure/tags/tag_dto.dart';
import 'package:inky/infrastructure/tags/tags_local_service.dart';

class TagRepository implements TagsInterface {
  final TagsLocalService _localService;

  TagRepository(TagsLocalService localService) : _localService = localService;

  @override
  Future<Either<InklingFailure, Unit>> create(Tag tag) async {
    try {
      await _localService.insert(TagDto.fromDomain(tag));
      return const Right(unit);
    } catch (e) {
      return const Left(
        InklingFailure.unableToCreate(),
      );
    }
  }

  Future<void> registerService() async => await _localService.init();

  @override
  Future<Either<InklingFailure, Unit>> delete(Tag tag) async {
    try {
      _localService.delete(TagDto.fromDomain(tag));
      return right(unit);
    } catch (e) {
      return left(const InklingFailure.unableToDelete());
    }
  }

  @override
  Future<Either<InklingFailure, Unit>> update(Tag tag) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Either<InklingFailure, List<Tag>>> fetchTags() async {
    try {
      final tagDtos = await _localService.fetchTags();
      return right(tagDtos.map((tagDto) => tagDto.toDomain()).toList());
    } catch (e) {
      return const Left(InklingFailure.unexpected());
    }
  }
}
