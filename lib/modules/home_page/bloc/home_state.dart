import '../../../common/models/video_model.dart';

abstract class HomeState {}

class HomeSuccess implements HomeState {
  final List<VideoModel> listVideos;

  const HomeSuccess(this.listVideos);
}

class HomeLoading implements HomeState {}

class HomeError implements HomeState {
  final String messageError;

  const HomeError(this.messageError);
}
