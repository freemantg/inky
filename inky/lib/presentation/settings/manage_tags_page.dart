import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';
import '../../styles/styles.dart';
import '../tags/tags_page.dart';

class ManageTagsPage extends StatelessWidget {
  const ManageTagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'SAVE',
                style: $styles.text.h4.copyWith(
                  color: $styles.colors.grey04,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            'MANAGE TAGS',
            style: $styles.text.h4.copyWith(
              color: $styles.colors.grey05,
            ),
          ),
          leading: IconButton(
            onPressed: () => context.go(ScreenPaths.settings),
            icon: const Icon(Icons.arrow_back_ios_new, size: 14.0),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: $styles.insets.sm),
          child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (_, __) => Divider(
              color: $styles.colors.grey02,
              height: 0,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                title: Text('UI/UX', style: $styles.text.bodySmallBold),
                trailing:
                    Icon(Icons.remove_circle, color: $styles.colors.accent1),
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
                "Add Tag",
                style: $styles.text.title1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                  height: 0,
                ),
              ),
            ),
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular($styles.corners.md)),
              ),
              context: context,
              builder: ((context) {
                return Padding(
                  padding: EdgeInsets.all($styles.insets.sm),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 14.0,
                            ),
                          ),
                          Text(
                            'ADD TAG',
                            style: $styles.text.bodySmallBold.copyWith(
                              color: $styles.colors.grey04,
                            ),
                          ),
                          Text(
                            'DONE',
                            style: $styles.text.bodySmallBold.copyWith(
                              color: $styles.colors.grey04,
                            ),
                          ),
                        ],
                      ),
                      HSpace(size: $styles.insets.sm),
                      const TagFilterTextField(),
                      //SizedBox to allow TextField to scroll w/ Bottomsheet
                      HSpace(size: MediaQuery.of(context).viewInsets.bottom),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
