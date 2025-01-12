import 'package:flutter/material.dart';

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        
        child: Column(
          children: [
          const  Center(
          child: Text("Hello",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 40,
            ),
            )),
          const  Center(
        child:SizedBox(
              width: 20,
              height: 20,
            )),

          const   Center(
       child: Text("World",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 40,
              ) ),),
              Center(
             child:Image.network('https://www.samsungshop.tn/26759-large_default/galaxy-s24-ultra-prix-tunisie.jpg', height: 200, 
            width: 300)),
              Center(
             child:Image.asset("assets/images/img1.jpg", height: 200, 
            width: 300),),
             Center(
             child:Image.asset("assets/images/img3.webp", height: 200, 
            width: 300),)

          ],)
        );
  }
}