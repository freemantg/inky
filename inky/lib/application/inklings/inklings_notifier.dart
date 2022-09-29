import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/inklings/inklings_repository.dart';

import '../../domain/inklings/inkling.dart';

part 'inklings_notifier.freezed.dart';

@freezed
class InklingsState with _$InklingsState {
  const factory InklingsState.initial() = _Initial;
  const factory InklingsState.loadInProgress() = _LoadInProgress;
  const factory InklingsState.loadSuccess({required List<Inkling> inklings}) =
      _LoadSuccess;
  const factory InklingsState.loadFailure({required InklingFailure failure}) =
      _LoadFailure;
}

class InklingsNotifier extends StateNotifier<InklingsState> {
  final InklingsRepository _repository;

  InklingsNotifier(this._repository) : super(const InklingsState.initial());

  Future<void> fetchInklings() async {
    final successOrFailure = await _repository.fetchInklings();
    state = successOrFailure.fold(
      (failure) => InklingsState.loadFailure(failure: failure),
      (inklings) => InklingsState.loadSuccess(inklings: inklings),
    );
  }

  Future<void> registerService() async => await _repository.registerService();
}
