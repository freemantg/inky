import 'package:inky/application/inklings/inklings_notifier.dart';
import 'package:inky/application/tags/tags_notifier.dart';
import 'package:inky/infrastructure/inklings/inklings_local_service.dart';
import 'package:inky/infrastructure/tags/tags_local_service.dart';
import 'package:inky/infrastructure/tags/tags_repository.dart';
import 'package:riverpod/riverpod.dart';

import 'application/inklings/form/inkling_form_notifier.dart';
import 'infrastructure/inklings/inklings_repository.dart';

//TAGS PROVIDERS
final tagsLocalServiceProvider = Provider((ref) => TagsLocalService());
final tagRepositoryProvider =
    Provider((ref) => TagRepository(ref.watch(tagsLocalServiceProvider)));
final tagsNotifierProvider =
    StateNotifierProvider.autoDispose<TagsNotifier, TagsState>(
        (ref) => TagsNotifier(tagRepository: ref.watch(tagRepositoryProvider)));

//INKLING PROVIDERS
final inklingLocalServiceProvider = Provider((ref) => InklingLocalServices());
final inklingRepositoryProvider = Provider(
  (ref) => InklingsRepository(ref.watch(inklingLocalServiceProvider)),
);
final inklingFormNotifierProvider =
    StateNotifierProvider<InklingFormNotifier, InklingFormState>(
  (ref) => InklingFormNotifier(ref.watch(inklingRepositoryProvider)),
);

final inklingsNotifierProvider =
    StateNotifierProvider<InklingsNotifier, InklingsState>(
        (ref) => InklingsNotifier(ref.watch(inklingRepositoryProvider)));
