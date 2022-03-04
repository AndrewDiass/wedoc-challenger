import '../../../common/constants/constants.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio client;

  HomeRepository(this.client);

  // Future<List> getVideos({required String nameTheChannel}) async {
  // var response = await client.get('/search', queryParameters: {
  //   'KEY': API_KEY,
  //   'forUsername': nameTheChannel,
  //   'part': 'snippet, id',
  //   'channelId': 'UC5hvPObwya8kzWWB-wmVlXg',
  //   'maxResults': 10,
  //   'type': 'video',
  //   'order': 'date'
  // });

  // return (response.data['items'] as List).map((i) => VideoModel.fromJson(i)).toList();
  // }
}


// https://www.googleapis.com/youtube/v3/search?part=id%2Csnippet&channelId=UC5hvPObwya8kzWWB-wmVlXg&key=AIzaSyANUIWjfKwIrSbR35BD_IVqudI7_39mzrM&maxResults=3&type=video&order=date