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

  Future<void> registerService() async => await _localService.init();

  @override
  Future<Either<TagFailure, Unit>> delete(Tag tag) async {
    try {
      _localService.delete(TagDto.fromDomain(tag));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToDelete());
    }
  }

  @override
  Either<TagFailure, List<Tag>> fetchTags({List<Tag>? filter}) {
    try {
      final query = filter?.map((tag) => TagDto.fromDomain(tag)).toList();
      final tagDtos = _localService.fetchTags(filter: query);
      final tags = tagDtos.map((tagDto) => tagDto.toDomain()).toList();
      return right(tags);
    } catch (e) {
      return const Left(TagFailure.unexpected());
    }
  }
}
