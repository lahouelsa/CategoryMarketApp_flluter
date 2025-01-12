import 'package:flutter/material.dart';

class Myproducts extends StatefulWidget {
  const Myproducts({super.key});

  @override
  State<Myproducts> createState() => _MyproductsState();
}

class _MyproductsState extends State<Myproducts> {
  int counter=0;
  List<String> images=[
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.webp',
    'assets/images/img4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Text("Image numéro : ${counter+1}",
          style:const TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
          )),
          Image.asset(images[counter],
          width: 250,
          height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _previousImage, 
              child: const Text('Précdent')),
              ElevatedButton(
                onPressed: _nextImage, 
              child: const Text('Suivant')),

            ],
          )
      ],
      
    );
  }

  void _previousImage() {
       setState(() {
      if (counter>0){
         counter--;
      }else{
        counter=images.length-1;
      }
     
    });

  }

  void _nextImage() {
    setState(() {
      if (counter<images.length-1){
         counter++;
      }else{
        counter=0;
      }
     
    });
  }
}