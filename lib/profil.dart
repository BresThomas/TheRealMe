// ElevatedButton.icon(
//             onPressed: () => FirebaseAuth.instance.signOut(),
//             icon: Icon(Icons.arrow_back),
//             label: Text(
//               "Sign Out",
//               style: TextStyle(fontSize: 24),
//             ),
//           ),

//               Container(
//             height: 50,
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => (RadarChartsPage())),
//                 );
//               },
//               child: Text(
//                 'Resultat du test',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: CustomThemes.black,
//                 ),
//               ),
//             ),
//           ),

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  bool _isNotificationEnabled = true;
  TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0);

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Gestion du compte',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Modifier le mot de passe'),
            onTap: () {
              // Navigate to change password page
            },
          ),
          ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(Icons.arrow_back),
            label: Text(
              "Sign Out",
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Paramètres de l\'application',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SwitchListTile(
            title: Text('Mode sombre'),
            value: _isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                _isDarkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Heure des notifications'),
            subtitle: Text('${_selectedTime.hour}:${_selectedTime.minute}'),
            onTap: () {
              _selectTime(context);
            },
          ),
          SwitchListTile(
            title: Text('Autoriser les notifications'),
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save settings and go back to previous page
            },
            child: Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
