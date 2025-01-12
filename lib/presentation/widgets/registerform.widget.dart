import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/controllers/user.controller.dart';
import 'package:get/get.dart';

class Registerform extends StatefulWidget {
  const Registerform({super.key});

  @override
  State<Registerform> createState() => _Registerform();
}

class _Registerform extends State<Registerform> {
  // Initialisation du contrôleur
  final AuthController _controller = Get.put(AuthController(
    userUseCase: Get.find(),
  ));

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordController2;

  // show the password or not
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Username",
                  labelText: "Username"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the username';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: _isObscure,
              controller: _passwordController,
              decoration: InputDecoration(
                icon: const Icon(Icons.key_rounded),
                hintText: "Password",
                labelText: "Password",
                // this button is used to toggle the password visibility
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the password';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: _isObscure2,
              controller: _passwordController2,
              decoration: InputDecoration(
                icon: const Icon(Icons.key_outlined),
                hintText: "Retape Password",
                labelText: "Retape Password",
                // this button is used to toggle the password visibility
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure2 ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure2 = !_isObscure2;
                      });
                    }),
              ),
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Retourne true si le formulaire est valide, sinon false
                  if (_formKey.currentState!.validate()) {
                    print(_usernameController.text);
                    print(_passwordController.text);

                    try {
                      // Appelle la méthode du controller GetX avec les valeurs des champs
                      _controller.register(
                        _usernameController.text,
                        _passwordController.text,
                      );

                      // Si l'ajout est réussi, afficher message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('User added successfully')),
                      );

                      // Redirection vers la page home
                      Navigator.of(context).pushNamed('/');
                    } catch (error) {
                      // Si une erreur survient, afficher un message d'erreur
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error adding user: $error')),
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.purpleAccent,
                  ),
                ),
                child: const Text("submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
