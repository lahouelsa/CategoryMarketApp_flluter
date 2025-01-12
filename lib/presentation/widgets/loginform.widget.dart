import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/controllers/user.controller.dart';
import 'package:get/get.dart';

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _Loginform();
}

class _Loginform extends State<Loginform> {
  // Initialisation du contrôleur
  final AuthController _controller = Get.put(AuthController(
    userUseCase: Get.find(),
  ));

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  // show the password or not
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
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
                  hintText: "Username", labelText: "Username"),
            ),
            TextFormField(
              obscureText: _isObscure,
              controller: _passwordController,
              decoration: InputDecoration(
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
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _controller
                        .login(
                      _usernameController.text,
                      _passwordController.text,
                    )
      .then((success) {
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User accepted')),
                        );
                        Navigator.of(context).pushNamed('/settingsDetails');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error: wrong user')),
                        );
                      }

                    }).catchError((error) {
                      // Gestion d'une éventuelle erreur inattendue
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $error')),
                      );
                    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
