import '../../../common/models/video_model.dart';

abstract class HomeState {}

class HomeSuccessState implements HomeState {
  final List<VideoModel> listVideos;

  const HomeSuccessState(this.listVideos);
}

class HomeLoadingState implements HomeState {}

class HomeErrorState implements HomeState {
  final String messageError;

  const HomeErrorState(this.messageError);
}
