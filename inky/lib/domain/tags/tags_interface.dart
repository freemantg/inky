import 'package:dartz/dartz.dart';

import 'tag.dart';
import 'tag_failure.dart';

abstract class TagsInterface {
  Stream<Either<TagFailure, List<Tag>>> streamTags(List<Tag> filter);
  Future<Either<TagFailure, Unit>> create(Tag tag);
  Future<Either<TagFailure, Unit>> delete(Tag tag);
}
