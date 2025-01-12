import 'package:flutter_application_1/data/datasource/models/article.model.dart';
import 'package:flutter_application_1/data/datasource/services/article.service.dart';

class ArticleRepository {
  final ArticleService artserv;

  ArticleRepository({required this.artserv});

//Affichage
  Future<List<Article?>?> getArticles() async {
    try {
      final articles = await artserv.getArticles();
      return articles.map((art) => Article.fromJson(art)).toList();
    } catch (error) {
      print("Error : $error");
      return null;
    }
  }
}
