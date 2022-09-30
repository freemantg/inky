import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inky/infrastructure/inklings/inkling_image_repository.dart';
import 'package:inky/infrastructure/inklings/inklings_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../../domain/inklings/inkling.dart';
import '../../../domain/tags/tag.dart';

part 'inkling_form_notifier.freezed.dart';

@freezed
class InklingFormState with _$InklingFormState {
  const factory InklingFormState({
    required Inkling inkling,
    required bool isEditing,
    required bool isSaving,
  }) = _InklingFormState;

  factory InklingFormState.initial() => InklingFormState(
        inkling: Inkling.empty(),
        isEditing: false,
        isSaving: false,
      );
}

class InklingFormNotifier extends StateNotifier<InklingFormState> {
  InklingFormNotifier(
    this._repository,
    this._imageRepository,
  ) : super(InklingFormState.initial());

  final InklingsRepository _repository;
  final InklingImageRepository _imageRepository;

  void initialized({required Inkling inkling}) {
    state = state.copyWith(
      inkling: inkling,
      isEditing: true,
    );
  }

  void noteChanged({required String noteStr}) {
    state = state.copyWith(
      inkling: state.inkling.copyWith(note: noteStr),
    );
  }

  void memoChanged({required String memoStr}) {
    state = state.copyWith(
      inkling: state.inkling.copyWith(memo: memoStr),
    );
  }

  void tagsChanged({required List<Tag> tags}) {
    state = state.copyWith(
      inkling: state.inkling.copyWith(tags: tags),
    );
  }

  Future<void> imagePathChanged({required bool isCameraSource}) async {
    final imagePath =
        await _imageRepository.pickImage(isCameraSource: isCameraSource);

    if (imagePath != null) {
      state = state.copyWith(
        inkling: state.inkling.copyWith(imagePath: imagePath),
      );
    }
  }

  void clearImagePath() {
    state = state.copyWith(
      inkling: state.inkling.copyWith(imagePath: ''),
    );
  }

  void linkChanged({required String linkStr}) {
    state = state.copyWith(
      inkling: state.inkling.copyWith(link: linkStr),
    );
  }

  Future<void> saved() async {
    state = state.copyWith(isSaving: true);
    final failureOrSuccess = state.isEditing
        ? await _repository.update(state.inkling)
        : await _repository.create(state.inkling);
    state = state.copyWith(isSaving: false);
  }
}
