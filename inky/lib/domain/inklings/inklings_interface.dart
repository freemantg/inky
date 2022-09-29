import 'package:dartz/dartz.dart';

import '../tags/tag_failure.dart';
import 'inkling.dart';

abstract class InklingsInterface {
  Future<Either<InklingFailure, List<Inkling>>> fetchInklings();
  Future<Either<InklingFailure, Unit>> create(Inkling inkling);
  Future<Either<InklingFailure, Unit>> update(Inkling inkling);
  Future<Either<InklingFailure, Unit>> delete(Inkling inkling);
}
