import 'package:dio/dio.dart';
import 'package:flutter_application_1/utils/constants.dart';

import 'dart:convert';
import 'dart:io';
class CategorieService {
  late Dio dio;

  CategorieService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    dio = Dio(options);
  }

  //Affichage
  Future<List<dynamic>> getCategories() async {
    try {
      Response response = await dio.get('/categories');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Ajout
  Future<Map<String, dynamic>> postCategorie(String nom, dynamic image) async {
    var params = {
      "nomcategorie": nom,
      "imagecategorie": image,
    };

    Response response = await dio.post(
      '/categories',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
    return response.data;
  }

//suppression
 Future<String> deleteCategorie(String id) async {
  try {
    final response = await dio.delete('/categories/$id');

    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    }
    
    // Supposons que la réponse contient un Map avec un champ "message"
    //le backend retourne {message: categorie deleted successfully.} 
    if (response.data is Map<String, dynamic>) {
      return response.data['message'] ?? 'Unknown error occurred';
    }
    
    // Gestion des cas où response.data n'est pas un Map
    return response.data.toString();
  } catch (e) {
    print('Erreur lors de la suppression: $e');
    rethrow;
  }
}
//update
 Future<Map<String, dynamic>> updateCategorie(String id, String nom, dynamic image) async {
     var params = {
      "nomcategorie": nom,
      "imagecategorie": image,
    };

    Response response = await dio.put(
      '/categories/$id',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
    return response.data;
  }

}


