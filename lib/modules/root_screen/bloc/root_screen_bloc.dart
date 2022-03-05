import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../repositories/home_video_repository.dart';
import '../../../repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'root_screen_event.dart';
part 'root_screen_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final HomeVideoRepository homeVideoRepository;
  final FavoriteVideoRepository favoriteVideoRepository;
  int currentIndex = 0;

  BottomNavigationBloc({required this.homeVideoRepository, required this.favoriteVideoRepository})
      : super(PageLoadingState()) {
    on<AppStartedEvent>(_appStarted);
    on<PageTappedEvent>(_pageTapped);
  }

  void _appStarted(AppStartedEvent event, Emitter<BottomNavigationState> emit) async {
    CurrentIndexChangedState(currentIndex: this.currentIndex);
    emit(PageLoadingState());
    String data = await _getFirstPageData();
    emit(FirstPageLoadedState(text: data));
  }

  //Nao esta rodando
  void _pageTapped(PageTappedEvent event, Emitter<BottomNavigationState> emit) async {
    this.currentIndex = event.index;
    CurrentIndexChangedState(currentIndex: this.currentIndex);
    emit(PageLoadingState());

    if (this.currentIndex == 0) {
      String data = await _getFirstPageData();
      emit(FirstPageLoadedState(text: data));
    }
    if (this.currentIndex == 1) {
      int data = await _getSecondPageData();
      emit(SecondPageLoadedState(number: data));
    }
  }

  Future<String> _getFirstPageData() async {
    String data = homeVideoRepository.data;
    if (data == null) {
      await homeVideoRepository.fetchData();
      data = homeVideoRepository.data;
    }
    return data;
  }

  Future<int> _getSecondPageData() async {
    int data = favoriteVideoRepository.data;
    if (data == null) {
      await favoriteVideoRepository.fetchData();
      data = favoriteVideoRepository.data;
    }
    return data;
  }
}
