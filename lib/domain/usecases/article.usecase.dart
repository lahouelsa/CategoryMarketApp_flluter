import 'package:flutter_application_1/data/datasource/repositories/article.repository.dart';
import 'package:flutter_application_1/domain/entities/article.entity.dart';

class ArticleUseCase {
  final ArticleRepository _respository;

  ArticleUseCase({required ArticleRepository respository})
      : _respository = respository;

  Future<List<ArticleEntity?>?> fetchArticles() async { 
    final result = await _respository.getArticles();
 
//Affichage
    final data = result?.map((element) {
      return ArticleEntity(
         id: element?.id ?? "",
         designation: element?.designation ?? "",
        prix: element?.prix ?? 0,
        qtestock: element?.qtestock ?? 0,
        imageart: element?.imageart ?? "",
      );
    }).toList();
   
    return data;
    }

}
