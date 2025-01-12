
import '../models/categories.model.dart';
import '../services/categorie.service.dart';

class CategorieRepository{
final CategorieService catserv ;

CategorieRepository({required this.catserv});

//Affichage
Future<List<Categorie>> getCategories() async{
final categories=await catserv.getCategories();
return categories.map((c) => Categorie.fromJson(c)).toList();
  }

//Ajout
Future<Map> postCategorie(String nom, dynamic image) async {
    final categorie = await catserv.postCategorie(nom, image);
      return categorie;
  }

//Suppression
Future<String> deleteCategorie(String id) async {
    try {
      final response = await catserv.deleteCategorie(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  //modification
Future<Map> updateCategorie(String id,String nom, dynamic image) async {
    final categorie = await catserv.updateCategorie(id,nom, image);
      return categorie;
  }


}
