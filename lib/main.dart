import 'package:flutter/material.dart';
import 'package:flutter_application_1/approuter.dart';
import 'package:flutter_application_1/data/datasource/localdatasource/user_local_data_source.dart';
import 'package:flutter_application_1/data/datasource/repositories/article.repository.dart';
import 'package:flutter_application_1/data/datasource/repositories/categorie.repository.dart';
import 'package:flutter_application_1/data/datasource/repositories/user.repository.dart';
import 'package:flutter_application_1/data/datasource/services/article.service.dart';
import 'package:flutter_application_1/data/datasource/services/categorie.service.dart';
import 'package:flutter_application_1/domain/usecases/article.usecase.dart';
import 'package:flutter_application_1/domain/usecases/categorie.usecase.dart';
import 'package:flutter_application_1/domain/usecases/user.usecase.dart';
import 'package:flutter_application_1/presentation/controllers/article.controllers.dart';
import 'package:flutter_application_1/presentation/controllers/categorie.controller.dart';
import 'package:flutter_application_1/presentation/controllers/user.controller.dart';
import 'package:get/instance_manager.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Fonction principale qui lance l'application Flutter
void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
 
 //Initialiser shoppingCart
 await PersistentShoppingCart().init();
 
  //injection articles getx
  Get.put(ArticleService());
  Get.put(ArticleRepository(artserv: Get.find()));
  Get.put(ArticleUseCase(respository: Get.find()));
  Get.put(ArticleController(useCase: Get.find()));

  //injection categories getx
  Get.put(CategorieService());
  Get.put(CategorieRepository(catserv: Get.find()));
  Get.put(CategorieUseCase(respository: Get.find()));
  Get.put(CategorieController(useCase: Get.find()));

// injection authentification
   Get.put(UserLocalDataSource());
  Get.put(UserRepository(localDataSource: Get.find()));
  Get.put(AuthenticateUserUseCase(repository: Get.find()));
  Get.put(AuthController(userUseCase: Get.find()));

  // Lance l'application en exécutant MyApp
  runApp(const MyApp());
}

// Définition de la classe stateless MyApp
class MyApp extends StatelessWidget {
  // Constructeur constant avec une clé facultative
  const MyApp({super.key});

  // Ce widget est la racine de l'application
  @override
  Widget build(BuildContext context) {
    // Retourne un MaterialApp configuré
    return MaterialApp(
       // Titre de l'application
      title: 'Flutter Application',
      // Thème de l'application avec une palette de couleurs personnalisée
      theme: ThemeData(
        // Utilisation d'un ColorScheme basé sur une couleur de départ
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Activation de Material Design 3
        useMaterial3: true,
        ),
      // Désactivation du bandeau "DEBUG"
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
       routes: appRoutes(),  // Utilisation des routes depuis le fichier séparé
    );
  }
  
}

