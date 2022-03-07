import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_theme.dart';

class EmptyVideos extends StatelessWidget {
  const EmptyVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppTheme.sizes.spacing16px),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            LottieBuilder.asset(AppTheme.lotties.emptySvg),
            SizedBox(
              height: AppTheme.sizes.spacing16px,
            ),
            Text("Nenhum video aqui"),
          ],
        ),
      ),
    );
  }
}
