import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';
import '../../styles/styles.dart';

class AddInklingPage extends StatelessWidget {
  const AddInklingPage({super.key});

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
          'ADD POST',
          style: $styles.text.h4.copyWith(
            color: $styles.colors.grey05,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: $styles.text.bodySmall,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          expands: true,
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
                              borderSide:
                                  BorderSide(color: $styles.colors.grey02),
                            ),
                            fillColor: $styles.colors.grey01,
                            filled: true,
                          ),
                        ),
                      ),
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
                          borderRadius:
                              BorderRadius.circular($styles.corners.sm),
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
                      HSpace(size: $styles.insets.sm),
                      TextField(
                        maxLines: 3,
                        style: $styles.text.bodySmall,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all($styles.insets.xs),
                          hintStyle: $styles.text.bodySmall.copyWith(
                            color: $styles.colors.grey02,
                          ),
                          hintText: 'What inspired the inkling?',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: $styles.colors.grey02),
                          ),
                          fillColor: $styles.colors.grey01,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0),
          child: Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              "Ink'd!",
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
}
