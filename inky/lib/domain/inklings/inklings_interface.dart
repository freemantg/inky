import 'package:dartz/dartz.dart';

import '../tags/tag_failure.dart';
import 'inkling.dart';

abstract class InklingsInterface {
  Future<Either<TagFailure, List<Inkling>>> fetchInklings();
  Future<Either<TagFailure, Unit>> create(Inkling inkling);
  Future<Either<TagFailure, Unit>> update(Inkling inkling);
  Future<Either<TagFailure, Unit>> delete(Inkling inkling);
}
