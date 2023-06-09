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
  Future<Either<TagFailure, Unit>> create(Tag tag) async {
    try {
      await _localService.insert(TagDto.fromDomain(tag));
      return const Right(unit);
    } catch (e) {
      return const Left(
        TagFailure.unableToCreate(),
      );
    }
  }

  @override
  Future<Either<TagFailure, Unit>> delete(Tag tag) async {
    try {
      await _localService.delete(TagDto.fromDomain(tag));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToDelete());
    }
  }

  @override
  Stream<Either<TagFailure, List<Tag>>> streamTags(List<Tag>? filter) {
    final dtoFilter = filter?.map((tag) => TagDto.fromDomain(tag)).toList();
    final stream = _localService.streamTags(filter: dtoFilter);
    return stream.map((tagDtos) {
      try {
        return right(tagDtos.map((e) => e.toDomain()).toList());
      } catch (e) {
        return left(const TagFailure.unexpected());
      }
    });
  }
}
