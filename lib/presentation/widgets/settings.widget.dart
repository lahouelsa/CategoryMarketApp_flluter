import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/map.screen.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  SettingsWidgetState createState() => SettingsWidgetState();
}

class SettingsWidgetState extends State<SettingsWidget> {
  // Variables pour stocker l'état des Switch
  bool notificationsEnabled = false;
  bool locationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                trailing: Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value; // Mise à jour de l'état
                    });
                    print('Notifications activées: $notificationsEnabled');
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location services'),
                trailing: Switch(
                  value: locationEnabled,
                  onChanged: (value) {
                    setState(() {
                      locationEnabled = value; // Mise à jour de l'état
                    });
                    print('Services de localisation activés: $locationEnabled');
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  // Action à définir pour la section About
                },
              ),
            ],
          ),
        ),
        // Si le service de localisation est activé, afficher la carte
        if (locationEnabled)
          const Expanded(
            child: SizedBox(
              height: 300,
              child: MapScreen(), // Affichage de la carte
            ),
          ),
      ],
    );
  }
}
