import 'package:dio/dio.dart';
import 'dart:math';

class FavoriteVideoRepository {
  final Dio dio;
  int? _data;

  FavoriteVideoRepository({
    required this.dio,
  });

  Future<void> fetchData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // store dummy data
    _data = Random().nextInt(1000);
  }

  int get data => _data != null ? data : 0;
}
