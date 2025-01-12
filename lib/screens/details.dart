import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.class.dart'; 
 
class Details extends StatelessWidget { 
  final Product myListElement; 
  const Details({ 
    super.key, 
    required this.myListElement, 
  }); 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text(myListElement.designation), 
        backgroundColor: const Color.fromARGB(255, 55, 147, 15), 
      ), 
      body: Stack( 
        children: [ 
          Container( 
            width: double.infinity, 
            height: double.infinity, 
            color: Colors.green, 
            margin: const EdgeInsets.all(10), 
            child: Hero( 
              tag: myListElement.usn, 
              transitionOnUserGestures: true, 
              child: Image.network(myListElement.image, fit: BoxFit.cover), 
            ), 
          ), 
         Positioned( 
          top: 600, 
          left: 20, 
          child : Container( 
            width: 220, 
            height: 50, 
            color: Colors.white, 
            child: Text("Pourcentage : ${myListElement.pourcentage}",style: const 
TextStyle(fontSize: 24)), 
          ), 
), 
Positioned( 
top: 600, 
left: 250, 
child : Container( 
width: 100, 
height: 50, 
color: Colors.white, 
child: Text("Note : ${myListElement.notes.toString()}",style: const 
TextStyle(fontSize: 24),), 
), 
), 
], 
), 
); 
} 
}