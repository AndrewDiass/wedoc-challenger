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
  }

  void _getVideos(HomeGetVideosEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      List<VideoModel> response = await homeVideoRepository.getVideo();

      emit(HomeSuccessState(response));
    } catch (e) {
      emit(HomeErrorState("Não foi possivel carregar os videos"));
    }
  }
}
