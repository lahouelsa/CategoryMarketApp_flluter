import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/categorie.controller.dart';
class Addcategorieform extends StatefulWidget {
  const Addcategorieform({super.key});

  @override
  State<Addcategorieform> createState() => _AddcategorieformState();
}

class _AddcategorieformState extends State<Addcategorieform> {

  // Initialisation du contrôleur
  final CategorieController _controller = Get.put(CategorieController(
    useCase: Get.find(),
  ));
   
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nomcategorieController;
 
  @override
  void initState() {
    super.initState();
    _nomcategorieController = TextEditingController();
   }

  var path;
  var imagecloud = "";

  final cloudinary =
      CloudinaryPublic('dynmzzxhj', 'ecommerce', cache: false);

  ImagePicker picker = ImagePicker();

  void _pickcamera() async {
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      path = File(image!.path);

      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );

        print(response.secureUrl);
        setState(() {
          imagecloud = response.secureUrl;

        });
     print("Image URL: $imagecloud");

      } on CloudinaryException catch (e) {
        print(e.message);
        print(e.request);
      }
  }

  void _pickgallery() async {
       XFile? image = await picker.pickImage(source: ImageSource.gallery);
      path = File(image!.path);

      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );

        print(response.secureUrl);
        setState(() {
          imagecloud = response.secureUrl;
        });
      } on CloudinaryException catch (e) {
        print(e.message);
        print(e.request);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nomcategorieController,
            decoration: const InputDecoration(
                hintText: "Category name", labelText: "Name"),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the name';
              }
              return null;
            },
          ),
                     Container(
              height: 40.0,
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  icon:
                      const Icon(Icons.photo_album_rounded, color: Colors.pink),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    _pickgallery();
                  },
                  label: const Text(
                    "PICK FROM GALLERY",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40.0,
                ),
                ElevatedButton.icon(
                  icon:
                      const Icon(Icons.camera_alt_sharp, color: Colors.purple),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                  onPressed: () {
                    _pickcamera();
                  },
                  label: const Text(
                    "PICK FROM CAMERA",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40.0,
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: imagecloud != ""
                      ? Image.network(imagecloud)
                      : Container(
                          decoration: BoxDecoration(color: Colors.red[200]),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
                Container(
                  height: 20.0,
                ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                // Retourne true si le formulaire est valide, sinon false
                if (_formKey.currentState!.validate()) {
                  print(_nomcategorieController.text);
                  print(imagecloud);

                   try {
                    // Appelle la méthode du controller GetX avec les valeurs des champs
                     _controller.postCategorie(
                      _nomcategorieController.text,
                      imagecloud,
                    );

                    // Si l'ajout est réussi, afficher message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Category added successfully')),
                    );

                    // Redirection vers la page des catégories 
                    Navigator.of(context).pushNamed('/Categories');
                  } catch (error) {
                    // Si une erreur survient, afficher un message d'erreur
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error adding category: $error')),
                    );
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.blueAccent,
                ),
              ),
              child: const Text("submit"),
            ),
          ),
        ],
      ),
        ],
        ),
    );
  }
}
