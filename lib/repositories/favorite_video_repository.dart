import '../common/constants/constants.dart';
import '../common/models/video_model.dart';
import '../common/network_data/dio_client.dart';

class FavoriteVideoRepository {
  final DioClient dio;

  FavoriteVideoRepository({
    required this.dio,
  });

  Future<List<VideoModel>> getVideo() async {
    var response = await dio.get('/search', queryParameters: {
      'key': API_KEY,
      'part': 'snippet, id',
      'channelId': CHANNEL_ID,
      'maxResults': 10,
      'type': 'video',
      'order': 'date',
      'fields': 'items(id(videoId),snippet(title,description,thumbnails(medium)))'
    });

    return (response["items"] as List).map((i) => VideoModel.fromJson(i)).toList();
  }
}
