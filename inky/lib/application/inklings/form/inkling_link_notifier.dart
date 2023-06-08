import 'package:dartz/dartz.dart';
import 'package:inky/domain/metadata/meta_data_failure.dart';
import 'package:inky/infrastructure/inklings/inklings_remote_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../../infrastructure/inklings/meta_data.dart';

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

  void updateState(Either<MetaDataFailure, MetaData?> successOrFailure) {
    state = successOrFailure.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (metaData) {
        return AsyncValue.data(metaData!);
      },
    );
  }

  void clearMetaData() => state = const AsyncValue.loading();
}
