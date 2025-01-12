import 'package:flutter/material.dart';

class Mybottomnavigationbar extends StatelessWidget {
  const Mybottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label:'Home',
          )  ,
          BottomNavigationBarItem(
             icon: Icon(Icons.camera),
            label:'Camera',
          ),
           BottomNavigationBarItem(
             icon: Icon(Icons.settings),
            label:'Settings',
          )
    ]);
  }
}