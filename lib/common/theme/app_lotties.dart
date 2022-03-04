abstract class AppLotties {
  String get loadingSvg;
}

class AppLottiesDefault implements AppLotties {
  @override
  String get loadingSvg => "assets/lotties/loading_splash.json";
}
