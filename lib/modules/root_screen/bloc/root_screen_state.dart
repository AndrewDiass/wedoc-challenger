part of 'root_screen_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChangedState extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChangedState({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoadingState extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class FirstPageLoadedState extends BottomNavigationState {
  final String text;

  FirstPageLoadedState({required this.text});

  @override
  String toString() => 'FirstPageLoaded with text: $text';
}

class SecondPageLoadedState extends BottomNavigationState {
  final int number;

  SecondPageLoadedState({required this.number});

  @override
  String toString() => 'SecondPageLoaded with number: $number';
}
