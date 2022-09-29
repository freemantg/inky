import 'package:inky/domain/inklings/inkling.dart';
import 'package:dartz/dartz.dart';
import 'package:inky/domain/inklings/inklings_interface.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/inklings/inklings_local_service.dart';

import 'inkling_dto.dart';

class InklingsRepository implements InklingsInterface {
  final InklingLocalServices _localServices;

  InklingsRepository(this._localServices);

  @override
  Future<Either<InklingFailure, Unit>> create(Inkling inkling) async {
    try {
      await _localServices.insert(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const InklingFailure.unableToCreate());
    }
  }

  @override
  Future<Either<InklingFailure, Unit>> delete(Inkling inkling) async {
    try {
      await _localServices.delete(InklingDto.fromDomain(inkling));
      return right(unit);
    } catch (e) {
      return left(const InklingFailure.unableToDelete());
    }
  }

  @override
  Future<Either<InklingFailure, List<Inkling>>> fetchInklings() async {
    try {
      final dtos = await _localServices.fetchInklings();
      return right(dtos.map((e) => e.toDomain()).toList());
    } catch (e) {
      return left(const InklingFailure.unexpected());
    }
  }

  @override
  Future<Either<InklingFailure, Unit>> update(Inkling inkling) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<void> registerService() async => await _localServices.init();
}
