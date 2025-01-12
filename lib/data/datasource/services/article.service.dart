import 'package:dio/dio.dart';
import 'package:flutter_application_1/utils/constants.dart';

class ArticleService {
  late Dio dio;

  ArticleService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    dio = Dio(options);
  }

  //Affichage
  Future<List<dynamic>> getArticles() async {
    try {
      Response response = await dio.get('/articles');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
