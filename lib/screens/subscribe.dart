import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  State<Subscribe> createState() => SubscribeState();
}

class SubscribeState extends State<Subscribe> {
  final _formKey = GlobalKey<FormState>(); // Correctement définir FormState
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Permet de scroller si l'écran est petit
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Name",
                  hintText: "Please enter name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter your Email",
                    labelText: "Email"),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: "Enter your password",
                    labelText: "Password"),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: "Enter your phone",
                    labelText: "Phone"),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Force la validation des champs du formulaire
                    if (_formKey.currentState!.validate()) {
                      // Si le formulaire est valide, affiche le Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
