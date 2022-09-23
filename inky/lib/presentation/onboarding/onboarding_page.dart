import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inky/styles/styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);

    final List<Widget> onboardingScreens = [
      const Placeholder(color: Colors.red),
      const Placeholder(color: Colors.blue),
      const Placeholder(color: Colors.green),
    ];

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          onPageChanged: (value) => pageIndex.value = value,
          physics: const ClampingScrollPhysics(),
          itemCount: onboardingScreens.length,
          itemBuilder: (context, index) {
            return onboardingScreens[index];
          },
        ),
        DotsIndicator(pageIndex: pageIndex.value)
      ],
    );
  }
}

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final dotsList = List<Widget>.generate(
        3, (index) => _buildDot(context, index == pageIndex));

    return Positioned(
      bottom: $styles.insets.xxl,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: dotsList,
      ),
    );
  }

  Widget _buildDot(
    BuildContext context,
    bool isActive,
  ) {
    const defaultCircleRadius = 9.0;

    final dot = Container(
      width: defaultCircleRadius,
      height: defaultCircleRadius,
      margin: EdgeInsets.all($styles.insets.xs),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? $styles.colors.grey04 : $styles.colors.grey01,
      ),
    );
    return dot;
  }
}
