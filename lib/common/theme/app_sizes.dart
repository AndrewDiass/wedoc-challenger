abstract class AppSizes {
  double get spacing4px;
  double get spacing8px;
  double get spacing16px;
  double get spacing32px;
}

class AppSizesDefault implements AppSizes {
  @override
  double get spacing4px => 4;

  @override
  double get spacing8px => 8;

  @override
  double get spacing16px => 16;

  @override
  double get spacing32px => 32;
}
