import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/inklings/inklings_repository.dart';

import '../../domain/inklings/inkling.dart';
import '../../domain/inklings/inkling_failure.dart';
import '../../domain/tags/tag.dart';
import '../../router.dart';

part 'inklings_notifier.freezed.dart';

@freezed
class InklingsState with _$InklingsState {
  const factory InklingsState.initial() = _Initial;
  const factory InklingsState.loadInProgress() = _LoadInProgress;
  const factory InklingsState.loadSuccess({
    required List<Inkling> inklings,
  }) = _LoadSuccess;
  const factory InklingsState.loadFailure({
    required TagFailure failure,
  }) = _LoadFailure;
}

class InklingsNotifier extends StateNotifier<InklingsState> {
  final InklingsRepository _repository;
  StreamSubscription<Either<InklingFailure, List<Inkling>>>?
      _inklingsStreamSubscription;

  InklingsNotifier(this._repository) : super(const InklingsState.initial());

  Future<void> fetchInklings({
    List<Tag>? filter,
    InklingType? inklingType,
  }) async {
    final successOrFailure = await _repository.fetchInklings(
      filter: filter,
      inklingType: inklingType,
    );

    state = successOrFailure.fold(
      (failure) => InklingsState.loadFailure(failure: failure),
      (inklings) => InklingsState.loadSuccess(inklings: inklings),
    );
  }

  Future<void> deleteInkling(Inkling inkling) async {
    final successOrFailure = await _repository.delete(inkling);
    successOrFailure.fold(
      (failure) => state = InklingsState.loadFailure(failure: failure),
      (success) async => await fetchInklings(),
    );
  }



  @override
  void dispose() {
    _inklingsStreamSubscription?.cancel();
    super.dispose();
  }
}
