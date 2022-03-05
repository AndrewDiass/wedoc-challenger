part of 'root_screen_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class EmptyPageState extends BottomNavigationState {}

class CurrentIndexChangedState extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChangedState({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class FirstPageLoadedState extends BottomNavigationState {}

class SecondPageLoadedState extends BottomNavigationState {}
