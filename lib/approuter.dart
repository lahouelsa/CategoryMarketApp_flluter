import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/presentation/widgets/cart/showcartitem.widget.dart';
import 'package:flutter_application_1/screens/articleslist.screen.dart';

import 'domain/entities/categorie.entity.dart';
import 'models/product.class.dart';
import 'presentation/screens/addcategorie.screen.dart';
import 'presentation/screens/categorieslist.screen.dart';
import 'presentation/screens/editcategorie.screen.widget.dart';
import 'presentation/screens/login.screen.dart';
import 'presentation/screens/register.screen.dart';
import 'presentation/screens/settings.screen.dart';
import 'screens/details.dart';
import 'screens/menu.dart';
import 'screens/products.dart';
import 'screens/subscribe.dart';
import 'widgets/myappbar.dart';
import 'widgets/mybottomnavigationbar.dart';
import 'widgets/mydrawer.dart';
import 'widgets/myproducts.dart';

Map<String,WidgetBuilder> appRoutes(){
  return{
       '/': (context) => const Scaffold(
          appBar: MyAppbar(),
          body: Menu(),
          drawer: Mydrawer(),
          bottomNavigationBar: Mybottomnavigationbar(),
        ),
    '/Items': (context) => Scaffold(
          appBar: AppBar(
            title: const Text('My Products'),
          ),
          body: const Myproducts(),
          drawer: const Mydrawer(),
          bottomNavigationBar: const Mybottomnavigationbar(),
        ),
    // '/Exit': (context) => const ExitScreen(), // Route associée à l'action de fermeture
    // '/Documents': (context) => const Documents(), // Route pour l'écran Documents
    '/Products': (context) => const Products(), // Route pour l'écran Products
    '/details': (context) {final product = ModalRoute.of(context)!.settings.arguments as Product;
                               return Details(myListElement: product);
    
                             },  // Route pour l'écran Details 
'/Settings': (context) => const Login(), // Route pour l'écran login
'/register': (context) => const Register(), // Route pour l'écran register
 '/settingsDetails': (context) => const SettingsScreen(), // Route pour l'écran SettingsScreen
    '/Subscribe': (context) => const Subscribe(), // Route pour l'écran Subscribe
    '/Categories': (context) => const Categorieslist(), // Route pour l'écran Categories
     '/addcategories': (context) => const Addcategorie(), // Route pour l'écran Addategorie
 '/editcategories': (context) {final categorie = ModalRoute.of(context)!.settings.arguments as CategorieEntity;
                               return Editcategorie(categorie: categorie);
                             },  // Route pour l'écran Editcategorie
  '/shopping': (context) => const ArticlesListScreen(), // Route pour l'écran ArticlesList    
  '/cartView': (context) => const CartView(), // Route pour l'écran cart view                       
  };

}
