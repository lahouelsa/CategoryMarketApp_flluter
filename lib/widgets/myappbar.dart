import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 91, 108, 163),
        title: const Text("Flutter Application"),
        actions: [
                   IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
              Navigator.pushNamed(context, '/shopping');
          },
        ),

          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              print("button Home");
            },
          ),
           IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              print("button Search");
            },
          )],
      );
  }
}