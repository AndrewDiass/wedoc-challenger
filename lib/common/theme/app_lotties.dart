abstract class AppLotties {
  String get loadingSvg;
  String get emptySvg;
  String get errorSvg;
}

class AppLottiesDefault implements AppLotties {
  @override
  String get loadingSvg => "assets/lotties/loading_lottie.json";
  String get emptySvg => "assets/lotties/empty.json";
  String get errorSvg => "assets/lotties/error.json";
}
