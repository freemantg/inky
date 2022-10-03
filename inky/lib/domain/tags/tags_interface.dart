import 'package:dartz/dartz.dart';

import 'tag.dart';
import 'tag_failure.dart';

abstract class TagsInterface {
  Either<TagFailure, List<Tag>> fetchTags();
  Future<Either<TagFailure, Unit>> create(Tag tag);
  Future<Either<TagFailure, Unit>> delete(Tag tag);
}
