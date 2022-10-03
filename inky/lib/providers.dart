import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod/riverpod.dart';

import 'application/application.dart';
import 'infrastructure/infrastructure.dart';

//Package providers
final httpProvider = Provider((ref) => Client());
final imagePickerProvider = Provider((ref) => ImagePicker());

//Tag providers
final tagsLocalServiceProvider = Provider((ref) => TagsLocalService());
final tagRepositoryProvider =
    Provider((ref) => TagRepository(ref.watch(tagsLocalServiceProvider)));
final tagsNotifierProvider =
    StateNotifierProvider.autoDispose<TagsNotifier, TagsState>((ref) =>
        TagsNotifier(tagRepository: ref.watch(tagRepositoryProvider))
          ..registerService());

//Inkling providers
final inklingLocalServiceProvider = Provider((ref) => InklingLocalServices());
final inklingRemoteService =
    Provider((ref) => InklingRemoteService(ref.watch(httpProvider)));
final inklingImageRepositoryProvider = Provider((ref) =>
    InklingImageRepository(imagePicker: ref.watch(imagePickerProvider)));
final inklingRepositoryProvider = Provider(
  (ref) => InklingsRepository(
    localServices: ref.watch(inklingLocalServiceProvider),
    remoteServices: ref.watch(inklingRemoteService),
  ),
);

//Inkling state providers
final inklingsNotifierProvider =
    StateNotifierProvider.autoDispose<InklingsNotifier, InklingsState>((ref) =>
        InklingsNotifier(ref.watch(inklingRepositoryProvider))
          ..registerService());

//State for holding MetaData during link preview during creation of link inkling
final inklingLinkNotifier = StateNotifierProvider.autoDispose<
        InklingLinkNotifier, AsyncValue<MetaData>>(
    (ref) => InklingLinkNotifier(ref.watch(inklingRemoteService)));

//State for holding inkling input data
final inklingFormNotifierProvider =
    StateNotifierProvider.autoDispose<InklingFormNotifier, InklingFormState>(
        (ref) => InklingFormNotifier(ref.watch(inklingRepositoryProvider),
            ref.watch(inklingImageRepositoryProvider)));

//State for managing inkling filters
final inklingFilterNotifier = StateNotifierProvider.autoDispose<
    InklingFilterNotifier,
    InklingFilterState>((ref) => InklingFilterNotifier());
