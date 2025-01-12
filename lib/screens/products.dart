import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.class.dart'; 
 
class Products extends StatefulWidget { 
  const Products({super.key}); 
 
  @override 
  ProductsState createState() => ProductsState(); 
} 
 
class ProductsState extends State<Products> { 
  @override 
  Widget build(BuildContext context) { 
     var myList = <Product>[ 
Product(1, 'NOKIA-C1', 99, "99 %", "https://www.mega.tn/assets/uploads/img/pr_telephonie_mobile/1543051941_211.jpg"), 
Product(2, 'BENCO-Y30', 85, "87 %", "https://www.technopro-online.com/41138-large_default/smartphone-tecnopop-2f-noir-tecno-pop2f-black.jpg"), 
Product(3, 'ITEL-P38', 89, "89 %", "https://tunisiatech.tn/8033-large_default/smartphone-itel-p38.jpg"), 
Product(4, 'SPARKGO22', 75, "80 %", "https://www.mega.tn/assets/uploads/img/pr_telephonie_mobile/1543051941_211.jpg"), 
Product(5, 'POP2F', 70, "65 %", "https://www.technopro-online.com/41138-large_default/smartphone-tecnopop-2f-noir-tecno-pop2f-black.jpg"), 
Product(6, 'OPPO-F9', 99, "99 %", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPYOtLk95pmWASWIkepdISwow5dPRsgzOmZXZq0jqIQJ3_d-Sy5vsVLdgcwtYfgFGD4&usqp=CAU"), 
Product(7, 'SPARKGO2022', 85, "87 %", "https://encryptedtbn0.gstatic.com/images?q=tbn:ANd9GcQHqp2vuXX3a5yqjAWkHFgOnZ7rJ8Y-mnk3EQ&s"), 
Product(8, 'TECNO', 89, "89 %", "https://www.mega.tn/assets/uploads/img/pr_telephonie_mobile/8c929smartphone-tecno-pop-6-2go-32go.jpg"), 
Product(9, 'SPARKGO22', 75, "80 %", "https://www.mega.tn/assets/uploads/img/pr_telephonie_mobile/1543051941_211.jpg"), 
Product(10, 'TECNO SPARK', 70, "65 %", "https://encryptedtbn0.gstatic.com/images?q=tbn:ANd9GcRY0hq7VvmOWGtOvtJVdZ8fVgBRBGSMEaanddr3yoi97ek6WjEYsP00t3WlQmhg3O8K60k&usqp=CAU"), 
];
    return Scaffold( 
        body: CustomScrollView( 
      slivers: [ 
        const SliverAppBar( 
          backgroundColor: Colors.deepPurpleAccent, 
          title: Text('Products'), 
          expandedHeight: 20, 
          collapsedHeight: 80, 
        ), 
        const SliverAppBar( 
          backgroundColor: Colors.deepOrangeAccent, 
          title: Text('Products List'), 
  
 
          floating: true, 
        ), 
             SliverList( 
          delegate: SliverChildBuilderDelegate( 
            (BuildContext context, int index) { 
              return Card( 
                margin: const EdgeInsets.all(15), 
                child: Container( 
                  color: Colors.blue[100 * (index % 9 + 1)], 
                  height: 80, 
                  alignment: Alignment.center, 
                 child: Column( 
                    mainAxisSize: MainAxisSize.min, 
                    children: [ 
                      ListTile( 
                       onTap: () { 
  
 
                          Navigator.of(context) 
                              .pushNamed("/details", arguments: myList[index]); 
                        }, 
                        leading: Hero( 
                          tag: myList[index].usn, 
                          transitionOnUserGestures: true, 
                          child: Image.network(myList[index].image,fit: 
BoxFit.cover), 
                        
                        ), 
                        subtitle: Text(myList[index].pourcentage), 
                      ), 
                    ], 
                  ), 
                ), 
              ); 
            }, 
             childCount: myList.length // 20 list items 
          ), 
        ), 
      ], 
    ), 
    ); 
  } 
} 
