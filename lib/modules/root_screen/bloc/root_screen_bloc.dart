import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/repositories.dart';

part 'root_screen_event.dart';
part 'root_screen_state.dart';

class RootScreenBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final FavoriteVideoRepository favoriteVideoRepository;
  int currentIndex = 0;

  RootScreenBloc({required this.favoriteVideoRepository}) : super(EmptyPageState()) {
    on<AppStartedEvent>(_appStarted);
    on<PageTappedEvent>(_pageTapped);
  }

  void _appStarted(AppStartedEvent event, Emitter<BottomNavigationState> emit) async {
    CurrentIndexChangedState(currentIndex: this.currentIndex);
    emit(FirstPageLoadedState());
  }

  void _pageTapped(PageTappedEvent event, Emitter<BottomNavigationState> emit) async {
    this.currentIndex = event.index;
    CurrentIndexChangedState(currentIndex: this.currentIndex);

    if (this.currentIndex == 0) {
      emit(FirstPageLoadedState());
    }
    if (this.currentIndex == 1) {
      emit(SecondPageLoadedState());
    }
  }
}
