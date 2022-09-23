import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';
import '../../styles/styles.dart';

enum InklingType { post, image, link }

class AddInklingPage extends StatelessWidget {
  const AddInklingPage(this.inklingType, {super.key});

  final InklingType inklingType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: $styles.colors.grey05),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.go(ScreenPaths.home),
          icon: const Icon(Icons.arrow_back_ios_new, size: 14.0),
        ),
        title: Text(
          'ADD ${inklingType.name.toUpperCase()}',
          style: $styles.text.h4.copyWith(
            color: $styles.colors.grey05,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _inklingTypeToWidget(inklingType),
                  HSpace(size: $styles.insets.md),
                  Text(
                    'Tags',
                    style: $styles.text.bodySmall.copyWith(
                      color: $styles.colors.grey04,
                    ),
                  ),
                  HSpace(size: $styles.insets.xs),
                  Container(
                    padding: EdgeInsets.all($styles.insets.xxs),
                    decoration: BoxDecoration(
                      color: $styles.colors.grey04,
                      borderRadius: BorderRadius.circular($styles.corners.sm),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).backgroundColor,
                      size: 18.0,
                    ),
                  ),
                  HSpace(size: $styles.insets.md),
                  Text(
                    'Memo',
                    style: $styles.text.bodySmall.copyWith(
                      color: $styles.colors.grey04,
                    ),
                  ),
                  HSpace(size: $styles.insets.xs),
                  const MemoTextField(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0),
          child: Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              "Ink It!",
              style: $styles.text.title1.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).backgroundColor,
                height: 0,
              ),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _inklingTypeToWidget(InklingType type) {
    switch (type) {
      case InklingType.post:
        return Expanded(
          child: TextFormField(
            maxLines: null,
            expands: true,
            style: $styles.text.bodySmall,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all($styles.insets.xs),
              hintText: 'Write your note...',
              hintStyle: $styles.text.bodySmall.copyWith(
                color: $styles.colors.grey02,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: $styles.colors.grey02),
              ),
              fillColor: $styles.colors.grey01,
              filled: true,
            ),
          ),
        );
      case InklingType.image:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($styles.corners.sm),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all($styles.insets.xxxs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: $styles.colors.grey02,
                ),
                child: Icon(
                  Icons.close,
                  color: $styles.colors.grey05,
                  size: 18.0,
                ),
              ),
            ],
          ),
        );
      case InklingType.link:
        return TextField(
          style: $styles.text.bodySmall,
          decoration: InputDecoration(
            isDense: true,
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: Container(
              padding: EdgeInsets.all($styles.insets.xs),
              decoration: BoxDecoration(
                color: $styles.colors.grey04,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular($styles.corners.sm),
                ),
              ),
              child: const Icon(Icons.add),
            ),
            suffixIconColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: $styles.insets.xs,
              vertical: 0,
            ),
            hintStyle: $styles.text.bodySmall.copyWith(
              color: $styles.colors.grey02,
            ),
            hintText: 'Paste your link inkling',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: $styles.colors.grey02),
            ),
            fillColor: $styles.colors.grey01,
            filled: true,
          ),
        );
    }
  }
}

class MemoTextField extends StatelessWidget {
  const MemoTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      maxLength: 150,
      style: $styles.text.bodySmall,
      decoration: InputDecoration(
        counterStyle: $styles.text.caption.copyWith(
          color: $styles.colors.grey02,
        ),
        contentPadding: EdgeInsets.all($styles.insets.xs),
        hintStyle: $styles.text.bodySmall.copyWith(
          color: $styles.colors.grey02,
        ),
        hintText: 'What inspired the inkling?',
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: $styles.colors.grey02),
        ),
        fillColor: $styles.colors.grey01,
        filled: true,
      ),
    );
  }
}
