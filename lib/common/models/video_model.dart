import 'dart:convert';

class VideoModel {
  String videoId;
  String title;
  String description;
  String thumbnailUrl;
  VideoModel({
    required this.videoId,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'videoId': videoId,
      'title': title,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        videoId: json['id']['videoId'],
        title: json['snippet']['title'],
        description: json['snippet']['description'],
        thumbnailUrl: json['snippet']['thumbnails']['medium']['url'],
      );
}
