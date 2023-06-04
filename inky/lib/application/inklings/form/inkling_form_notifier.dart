import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod/riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

part 'inkling_form_notifier.freezed.dart';

@freezed
class InklingFormState with _$InklingFormState {
  const factory InklingFormState({
    required Inkling inkling,
    required bool isEditing,
    required bool isSaving,
    required bool showErrorMessage,
    String? errorMessage,
  }) = _InklingFormState;

  factory InklingFormState.initial() => InklingFormState(
        inkling: Inkling.empty(),
        isEditing: false,
        isSaving: false,
        showErrorMessage: false,
      );
}

class InklingFormNotifier extends StateNotifier<InklingFormState> {
  InklingFormNotifier(
    this._repository,
    this._imageRepository,
  ) : super(InklingFormState.initial());

  final InklingsRepository _repository;
  final InklingImageRepository _imageRepository;

  void _updateStateIfChanged(Inkling newInkling) {
    if (newInkling != state.inkling) {
      state = state.copyWith(inkling: newInkling);
    }
  }

  void initialized({required Inkling? inkling}) {
    if (inkling != null && inkling != state.inkling) {
      state = state.copyWith(
        inkling: inkling,
        isEditing: true,
      );
    }
  }

  void noteChanged({required String noteStr}) {
    _updateStateIfChanged(state.inkling.copyWith(note: noteStr));
  }

  void memoChanged({required String memoStr}) {
    _updateStateIfChanged(state.inkling.copyWith(memo: memoStr));
  }

  void tagsChanged({required List<Tag> tags}) {
    _updateStateIfChanged(state.inkling.copyWith(tags: tags));
  }

  Future<void> imagePathChanged({required bool isCameraSource}) async {
    final imagePath =
        await _imageRepository.pickImage(isCameraSource: isCameraSource);

    if (imagePath != null) {
      _updateStateIfChanged(state.inkling.copyWith(imagePath: imagePath));
    }
  }

  void clearImagePath() {
    _updateStateIfChanged(state.inkling.copyWith(imagePath: ''));
  }

  void linkChanged({required String linkStr}) {
    _updateStateIfChanged(state.inkling.copyWith(link: linkStr));
  }

  Future<void> saved() async {
    state = state.copyWith(isSaving: true);
    final failureOrSuccess = state.isEditing
        ? await _repository.update(state.inkling)
        : await _repository.create(state.inkling);

    state = failureOrSuccess.fold(
      (failure) => state.copyWith(
        showErrorMessage: true,
        isSaving: false,
        errorMessage: failure.toString(), // give more specific error message
      ),
      (success) => state.copyWith(isSaving: false),
    );
  }
}
