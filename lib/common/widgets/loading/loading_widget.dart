import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_theme.dart';

class LoadingPageWidget extends StatelessWidget {
  final Widget? loaderIcon;
  final double? loaderSize;
  final Color backgroundColor;
  final Color? modalColor;
  final VoidCallback? onUpdate;

  const LoadingPageWidget({
    Key? key,
    this.loaderIcon,
    this.backgroundColor = const Color(0xFFAFAFAF),
    this.loaderSize,
    this.modalColor = Colors.transparent,
    this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.transparent, borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LottieBuilder.asset(AppTheme.lotties.loadingSvg),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
