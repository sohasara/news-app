import 'package:dio/dio.dart';
import 'package:news_app/api/data_class.dart';

class Repository {
  final Dio dio = Dio();
  final String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=421f2580c9664c9b8fe1069decdd9b83';
  Future<NewsRes> fetchNews() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return NewsRes.fromMap(response.data);
    } else {
      throw Exception('Failed to load data ');
    }
  }
}
