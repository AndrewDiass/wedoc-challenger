part of 'root_screen_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends BottomNavigationEvent {
  @override
  String toString() => 'AppStarted';
}

class PageTappedEvent extends BottomNavigationEvent {
  final int index;

  PageTappedEvent({required this.index});

  @override
  String toString() => 'PageTapped: $index';
}
