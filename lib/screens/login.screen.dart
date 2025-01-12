import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/loginform.widget.dart';
// ignore: unused_import
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: Colors.purpleAccent,
          title: const Text("Login"),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_2_outlined),
          ),
            ),
        body: const Loginform(),
    );
  }
}
