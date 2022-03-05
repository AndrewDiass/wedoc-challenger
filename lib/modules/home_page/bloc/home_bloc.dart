import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/models/video_model.dart';
import 'package:dio/dio.dart';

import '../../../common/constants/constants.dart';

import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeSuccessState([])) {
    on<HomeGetVideosEvent>(_getVideos);
    on<FavoritedVideoEvent>(_favoritedVideo);
  }

  @override
  List<VideoModel> get initialState => [];

  void _getVideos(HomeGetVideosEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      var response = await Dio().get('https://www.googleapis.com/youtube/v3/search', queryParameters: {
        'key': API_KEY,
        'part': 'snippet, id',
        'channelId': 'UC5hvPObwya8kzWWB-wmVlXg',
        'maxResults': 10,
        'type': 'video',
        'order': 'date',
        'fields': 'items(id(videoId),snippet(title,description,thumbnails(medium)))'
      });

      emit(HomeSuccessState((response.data['items'] as List).map((i) => VideoModel.fromJson(i)).toList()));
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
      print("eaee1");
    } else {
      videoIds.add(event.videoId);
      await prefs.setStringList('favoriteVideoIds', videoIds);
      print("eaee2");
    }

    print(videoIds);
  }
}
