import '../../../common/models/video_model.dart';

abstract class FavoriteState {}

class FavoriteSuccessState implements FavoriteState {
  final List<VideoModel> listVideos;

  const FavoriteSuccessState(this.listVideos);
}

class FavoriteLoadingState implements FavoriteState {}

class FavoriteErrorState implements FavoriteState {
  final String messageError;

  const FavoriteErrorState(this.messageError);
}
