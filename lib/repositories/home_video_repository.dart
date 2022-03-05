import 'package:dio/dio.dart';

class HomeVideoRepository {
  final Dio dio;
  String? _data;
  HomeVideoRepository({
    required this.dio,
  });

  Future<void> fetchData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // store dummy data
    _data = 'First Page';
  }

  String get data => _data != null ? data : '';
}
