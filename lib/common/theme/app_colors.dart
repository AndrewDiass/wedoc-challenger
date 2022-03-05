import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
  // Color get spacing8px;
  // Color get spacing16px;
  // Color get spacing32px;
}

class AppColorsDefault implements AppColors {
  @override
  Color get background => Color(0xffF0F2F5);

  // @override
  // double get spacing8px => 8;

  // @override
  // double get spacing16px => 16;

  // @override
  // double get spacing32px => 32;
}
