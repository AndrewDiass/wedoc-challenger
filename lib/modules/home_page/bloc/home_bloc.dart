import 'dart:async';

import '../../../common/models/video_model.dart';
import 'package:dio/dio.dart';

import '../../../common/constants/constants.dart';

import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeSuccess([])) {
    on<HomeGetVideosEvent>(_getVideos);
  }

  void _getVideos(HomeGetVideosEvent event, Emitter<HomeState> emit) async {
    // yield homeLoading();
    emit(HomeLoading());
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

      print("Meus videos => $response");

      var eaee = (response.data['items'] as List).map((i) => VideoModel.fromJson(i)).toList();

      print("Meus videos => $eaee");

      emit(HomeSuccess(eaee));
    } catch (e) {
      print(e);
      emit(HomeError("Não foi possivel carregar os videos"));
    }
  }
}
