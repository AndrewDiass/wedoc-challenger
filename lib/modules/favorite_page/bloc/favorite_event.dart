import 'package:equatable/equatable.dart';

abstract class FavoriteEvent {}

class FavoriteGetVideosEvent implements FavoriteEvent {}

class FavoritedVideoEvent implements FavoriteEvent {
  final String videoId;
  FavoritedVideoEvent({
    required this.videoId,
  });
}
