import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inky/application/inklings/inklings_notifier.dart';
import 'package:inky/application/tags/inkling_filter_notifier.dart';
import 'package:inky/application/tags/tags_notifier.dart';
import 'package:inky/infrastructure/inklings/inklings_local_service.dart';
import 'package:inky/infrastructure/inklings/inklings_remote_service.dart';
import 'package:inky/infrastructure/tags/tags_local_service.dart';
import 'package:inky/infrastructure/tags/tags_repository.dart';
import 'package:riverpod/riverpod.dart';

import 'application/inklings/form/inkling_form_notifier.dart';
import 'application/inklings/form/inkling_link_notifier.dart';
import 'infrastructure/inklings/inkling_image_repository.dart';
import 'infrastructure/inklings/inklings_repository.dart';
import 'infrastructure/inklings/meta_data_parser_repository.dart';

//TAGS PROVIDERS
final tagsLocalServiceProvider = Provider((ref) => TagsLocalService());
final tagRepositoryProvider =
    Provider((ref) => TagRepository(ref.watch(tagsLocalServiceProvider)));
final tagsNotifierProvider =
    StateNotifierProvider.autoDispose<TagsNotifier, TagsState>((ref) =>
        TagsNotifier(tagRepository: ref.watch(tagRepositoryProvider))
          ..registerService());

//INKLING PROVIDERS
final inklingLocalServiceProvider = Provider((ref) => InklingLocalServices());
final inklingRepositoryProvider = Provider(
  (ref) => InklingsRepository(
    localServices: ref.watch(inklingLocalServiceProvider),
    remoteServices: ref.watch(inklingRemoteService),
  ),
);

final imagePickerProvider = Provider((ref) => ImagePicker());
final inklingImageRepositoryProvider = Provider((ref) =>
    InklingImageRepository(imagePicker: ref.watch(imagePickerProvider)));

final inklingFormNotifierProvider =
    StateNotifierProvider.autoDispose<InklingFormNotifier, InklingFormState>(
        (ref) => InklingFormNotifier(ref.watch(inklingRepositoryProvider),
            ref.watch(inklingImageRepositoryProvider)));

final inklingsNotifierProvider =
    StateNotifierProvider.autoDispose<InklingsNotifier, InklingsState>((ref) =>
        InklingsNotifier(ref.watch(inklingRepositoryProvider))
          ..registerService());

final httpProvider = Provider((ref) => Client());
final inklingRemoteService =
    Provider((ref) => InklingRemoteService(ref.watch(httpProvider)));

final inklingLinkNotifier = StateNotifierProvider.autoDispose<
        InklingLinkNotifier, AsyncValue<MetaData>>(
    (ref) => InklingLinkNotifier(ref.watch(inklingRemoteService)));

final inklingFilterNotifier = StateNotifierProvider.autoDispose<
    InklingFilterNotifier,
    InklingFilterState>((ref) => InklingFilterNotifier());
