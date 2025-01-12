import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/registerform.widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: Colors.purpleAccent,
          title: const Text("Register"),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.app_registration_outlined),
          ),
            ),
        body: const Registerform(),
    );
  }
}
