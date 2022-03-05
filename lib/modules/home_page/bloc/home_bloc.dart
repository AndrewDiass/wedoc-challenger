import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/video_model.dart';
import '../../../repositories/home_video_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeVideoRepository homeVideoRepository;

  HomeBloc({required this.homeVideoRepository}) : super(HomeSuccessState([])) {
    on<HomeGetVideosEvent>(_getVideos);
    on<FavoritedVideoEvent>(_favoritedVideo);
  }

  // @override
  // List<VideoModel> get videoList => [];

  void _getVideos(HomeGetVideosEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      List<VideoModel> response = await homeVideoRepository.getVideo();

      emit(HomeSuccessState(response));
    } catch (e) {
      print(e);
      emit(HomeErrorState("Não foi possivel carregar os videos"));
    }
  }

  void _favoritedVideo(FavoritedVideoEvent event, Emitter<HomeState> emit) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? videoIds = prefs.getStringList('favoriteVideoIds');

    if (videoIds == null) {
      await prefs.setStringList('favoriteVideoIds', <String>[event.videoId]);
    } else {
      videoIds.add(event.videoId);
      await prefs.setStringList('favoriteVideoIds', videoIds);
    }
  }
}
