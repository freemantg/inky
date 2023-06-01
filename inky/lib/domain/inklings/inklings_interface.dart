import 'package:dartz/dartz.dart';
import 'package:inky/domain/domain.dart';

import '../tags/tag_failure.dart';
import 'inkling.dart';

abstract class InklingsInterface {
  Stream<Either<InklingFailure, List<Inkling>>> watchInklings();
  Future<Either<InklingFailure, Unit>> create(Inkling inkling);
  Future<Either<InklingFailure, Unit>> update(Inkling inkling);
  Future<Either<InklingFailure, Unit>> delete(Inkling inkling);
}
