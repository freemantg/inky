import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/inklings/inkling.dart';
import '../../domain/inklings/inkling_failure.dart';
import '../../infrastructure/infrastructure.dart';

part 'inklings_notifier.freezed.dart';

@freezed
class InklingsState with _$InklingsState {
  const factory InklingsState.initial() = _Initial;
  const factory InklingsState.loadInProgress() = _LoadInProgress;
  const factory InklingsState.loadSuccess({
    required List<Inkling> inklings,
  }) = _LoadSuccess;
  const factory InklingsState.loadFailure({
    required InklingFailure failure,
  }) = _LoadFailure;
}

class InklingsNotifier extends StateNotifier<InklingsState> {
  final InklingsRepository _repository;

  InklingsNotifier(this._repository) : super(const InklingsState.initial()) {
    watchInklings();
  }

  Future<void> watchInklings() async {
    state = const InklingsState.loadInProgress();
    final inklingStream = _repository.watchInklings();
    inklingStream.listen(
      (successOrFailure) {
        successOrFailure.fold(
          (failure) => state = InklingsState.loadFailure(failure: failure),
          (inklings) => state = InklingsState.loadSuccess(inklings: inklings),
        );
      },
      onError: (failure) => state = InklingsState.loadFailure(
        failure:
            InklingFailure.unexpected(message: "Unexpected error: $failure"),
      ),
    );
  }

  Future<void> deleteInkling(Inkling inkling) async {
    final successOrFailure = await _repository.delete(inkling);
    successOrFailure.fold(
      (failure) => state = InklingsState.loadFailure(failure: failure),
      (success) => {},
    );
  }
}
