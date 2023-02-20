import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:radar_charts_app/pages/home_screen/phone_home_screen.dart';
import 'package:radar_charts_app/profil.dart';
import 'package:radar_charts_app/quiz_personality.dart';
import 'package:radar_charts_app/quiz_self-confidence.dart';
import 'package:radar_charts_app/radar_charts.dart';
import 'package:radar_charts_app/theme.dart';
import 'breathing.dart';
import 'login_page.dart';

import 'package:google_fonts/google_fonts.dart';

import 'mood_tracker.dart';
import 'pages/home_screen/computer_home_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Real Me',
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      home: const MyHomePage(title: 'Acceuil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomThemes.white,
      appBar: AppBar(
        backgroundColor: CustomThemes.primaryColor,
        title: Text(
          widget.title,
          style: TextStyle(color: CustomThemes.black),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800) {
          return home_screen_phone();
        } else {
          return home_screen_computer();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // change the selected index as needed
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
    );
  }
}
