import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod/riverpod.dart';

import 'application/application.dart';
import 'infrastructure/infrastructure.dart';
import 'infrastructure/inklings/inkling_image_picker.dart';

//Package providers
final httpProvider = Provider((ref) => Client());
final imagePickerProvider = Provider((ref) => ImagePicker());

//Tag providers
final tagsLocalServiceProvider =
    Provider<TagsLocalService>((ref) => throw UnimplementedError());
final tagRepositoryProvider =
    Provider((ref) => TagRepository(ref.watch(tagsLocalServiceProvider)));
final tagsNotifierProvider = StateNotifierProvider<TagsNotifier, TagsState>(
  (ref) => TagsNotifier(tagRepository: ref.watch(tagRepositoryProvider)),
);

//Inkling providers
final inklingLocalServiceProvider =
    Provider<InklingLocalServices>((ref) => throw UnimplementedError());
final inklingRemoteService =
    Provider((ref) => InklingRemoteService(ref.watch(httpProvider)));
final inklingImagePickerProvider =
    Provider((ref) => InklingImagePicker(ref.watch(imagePickerProvider)));
final inklingImageRepositoryProvider = Provider((ref) =>
    InklingImageRepository(imagePicker: ref.watch(inklingImagePickerProvider)));
final inklingRepositoryProvider = Provider(
  (ref) => InklingsRepository(
    localServices: ref.watch(inklingLocalServiceProvider),
    remoteServices: ref.watch(inklingRemoteService),
  ),
);

//Inkling state providers
final inklingsNotifierProvider =
    StateNotifierProvider<InklingsNotifier, InklingsState>(
        (ref) => InklingsNotifier(ref.watch(inklingRepositoryProvider)));

//State for holding MetaData during link preview during creation of link inkling
final inklingLinkNotifierProvider =
    StateNotifierProvider<InklingLinkNotifier, AsyncValue<MetaData>>(
        (ref) => InklingLinkNotifier(ref.watch(inklingRemoteService)));

//State for holding inkling input data
final inklingFormNotifierProvider =
    StateNotifierProvider<InklingFormNotifier, InklingFormState>((ref) =>
        InklingFormNotifier(ref.watch(inklingRepositoryProvider),
            ref.watch(inklingImageRepositoryProvider)));

//State for managing inkling filters
final inklingFilterNotifierProvider =
    StateNotifierProvider<InklingFilterNotifier, InklingFilterState>(
        (ref) => InklingFilterNotifier());
