import 'package:flutter/material.dart';

import '../../../domain/inklings/inkling.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class InklingGridBuilder extends StatelessWidget {
  const InklingGridBuilder({
    super.key,
    required this.inklings,
  });

  final List<Inkling> inklings;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: inklings.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: $styles.insets.xs,
        crossAxisSpacing: $styles.insets.xs,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final inkling = inklings[index];
        return InklingCard(inkling: inkling);
      },
    );
  }
}
