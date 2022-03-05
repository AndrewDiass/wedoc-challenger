import '../../../common/models/video_model.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/favorite_video_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteVideoRepository favoriteVideoRepository;

  FavoriteBloc({required this.favoriteVideoRepository}) : super(FavoriteSuccessState([])) {
    on<FavoriteGetVideosEvent>(_getVideos);
  }

  void _getVideos(FavoriteGetVideosEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoadingState());
    try {
      List<VideoModel> response = await favoriteVideoRepository.getVideo();

      emit(FavoriteSuccessState(response));
    } catch (e) {
      emit(FavoriteErrorState("Não foi possivel carregar os videos"));
    }
  }
}
