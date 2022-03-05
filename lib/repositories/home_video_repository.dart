import '../common/models/video_model.dart';

import '../common/constants/constants.dart';
import '../common/network_data/dio_client.dart';

class HomeVideoRepository {
  final DioClient dio;
  HomeVideoRepository({
    required this.dio,
  });

  Future<List<VideoModel>> getVideo() async {
    var response = await dio.get('/search', queryParameters: {
      'key': API_KEY,
      'part': 'snippet, id',
      'channelId': 'UC5hvPObwya8kzWWB-wmVlXg',
      'maxResults': 10,
      'type': 'video',
      'order': 'date',
      'fields': 'items(id(videoId),snippet(title,description,thumbnails(medium)))'
    });

    return (response["items"] as List).map((i) => VideoModel.fromJson(i)).toList();
  }
}
