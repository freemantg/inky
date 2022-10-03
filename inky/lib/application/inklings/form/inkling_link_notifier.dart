import 'package:dartz/dartz.dart';
import 'package:inky/infrastructure/inklings/inklings_remote_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../../domain/tags/tag_failure.dart';
import '../../../infrastructure/inklings/meta_data_parser_repository.dart';

class InklingLinkNotifier extends StateNotifier<AsyncValue<MetaData>> {
  final InklingRemoteService _remoteService;

  InklingLinkNotifier(this._remoteService) : super(const AsyncValue.loading());

  Future<void> fetchMetaData({required String url}) async {
    final successOrFailure = await _remoteService.fetchMetaData(url);
    updateState(successOrFailure);
  }

  void initialise(MetaData? metaData) {
    if (metaData == null) return;
    state = AsyncData(metaData);
  }

  void updateState(Either<InklingFailure, MetaData?> successOrFailure) {
    state = successOrFailure.fold(
      (failure) => AsyncValue.error(failure),
      (metaData) {
        print(metaData?.title);
        return AsyncValue.data(metaData!);
      },
    );
  }

  void clearMetaData() => state = const AsyncValue.loading();
}
