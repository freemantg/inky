import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';

class StyledAppbarLeadingBackButton extends StatelessWidget {
  const StyledAppbarLeadingBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.go(ScreenPaths.home),
      icon: const Icon(Icons.arrow_back_ios_new, size: 14.0),
    );
  }
}
