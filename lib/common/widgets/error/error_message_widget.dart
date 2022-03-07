import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_theme.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? errorMessage;

  ErrorMessageWidget({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppTheme.sizes.spacing16px),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            LottieBuilder.asset(AppTheme.lotties.errorSvg),
            SizedBox(
              height: AppTheme.sizes.spacing16px,
            ),
            Text(errorMessage ?? "Algo aconteceu, tente novamente mais tarde"),
          ],
        ),
      ),
    );
  }
}
