import 'package:dartz/dartz.dart';
import 'package:inky/domain/domain.dart';

abstract class InklingsInterface {
  Stream<Either<InklingFailure, List<Inkling>>> watchInklings();
  Future<Either<InklingFailure, Unit>> upsert(Inkling inkling);
  Future<Either<InklingFailure, Unit>> delete(Inkling inkling);
}
