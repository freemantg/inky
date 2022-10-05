import 'package:flutter/material.dart' hide MetaData;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:inky/presentation/presentation.dart';
import 'package:inky/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../domain/domain.dart';
import '../../../styles/styles.dart';

class LinkTextField extends StatefulHookConsumerWidget {
  const LinkTextField({super.key, this.inkling});

  @override
  ConsumerState<LinkTextField> createState() => _LinkTextFieldState();

  final Inkling? inkling;
}

class _LinkTextFieldState extends ConsumerState<LinkTextField> {
  @override
  void initState() {
    super.initState();
    ref.read(inklingLinkNotifier.notifier).initialise(widget.inkling?.metaData);
  }

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    ref.listen(
      inklingFormNotifierProvider,
      (previous, next) {
        if (previous?.inkling.link != next.inkling.link &&
            next.inkling.link.isNotEmpty) {
          ref
              .read(inklingLinkNotifier.notifier)
              .fetchMetaData(url: next.inkling.link);
        }
      },
    );

    final metaDataValue = ref.watch(inklingLinkNotifier);
    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.grey01,
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: metaDataValue.maybeWhen(
        data: (metaData) => MetaDataLinkPreview(metaData: metaData),
        orElse: () => StyledLinkParseTextField(
          textEditingController: textEditingController,
        ),
        error: (_, __) => const Icon(Icons.error),
      ),
    );
  }
}

class StyledLinkParseTextField extends ConsumerWidget {
  const StyledLinkParseTextField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: textEditingController,
      style: $styles.text.bodySmall,
      decoration: StyledInputDecoration(
        hintText: 'Paste in your dinspiration',
        suffixIcon: _AddLinkButton(onTap: () {
          ref
              .read(inklingFormNotifierProvider.notifier)
              .linkChanged(linkStr: textEditingController.text);
          textEditingController.clear();
        }),
        isDense: true,
      ),
    );
  }
}

class MetaDataLinkPreview extends StatelessWidget {
  const MetaDataLinkPreview({
    super.key,
    required this.metaData,
  });

  final MetaData metaData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Column(
              children: [
                Text(
                  metaData.title ?? '',
                  style: $styles.text.title2,
                  maxLines: 1,
                ),
                StyledSubtitle(title: metaData.url ?? '', size: 11)
              ],
            ),
          ),
        ),
        if (metaData.imageUrl != null)
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                  imageUrl: metaData.imageUrl!,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular($styles.corners.md),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (_, __) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                ),
                const _ClearLinkButton(),
              ],
            ),
          ),
      ],
    );
  }
}

class _ClearLinkButton extends ConsumerWidget {
  const _ClearLinkButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(inklingLinkNotifier.notifier).clearMetaData();
        ref.read(inklingFormNotifierProvider.notifier).linkChanged(linkStr: '');
      },
      child: Padding(
        padding: EdgeInsets.all($styles.insets.xs),
        child: Icon(
          Icons.cancel,
          color: $styles.colors.grey01.withOpacity(0.5),
        ),
      ),
    );
  }
}

class _AddLinkButton extends StatelessWidget {
  const _AddLinkButton({required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all($styles.insets.xs),
        decoration: BoxDecoration(
          color: $styles.colors.grey04,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular($styles.corners.sm),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
