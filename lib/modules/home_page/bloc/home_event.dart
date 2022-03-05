import 'package:equatable/equatable.dart';

abstract class HomeEvent {}

class HomeGetVideosEvent implements HomeEvent {}

class FavoritedVideoEvent implements HomeEvent {
  final String videoId;
  FavoritedVideoEvent({
    required this.videoId,
  });
}
