import 'package:dartz/dartz.dart';

import 'tag.dart';
import 'tag_failure.dart';

abstract class TagsInterface {
  Future<Either<InklingFailure, List<Tag>>> fetchTags();
  Future<Either<InklingFailure, Unit>> create(Tag tag);
  Future<Either<InklingFailure, Unit>> update(Tag tag);
  Future<Either<InklingFailure, Unit>> delete(Tag tag);
}
