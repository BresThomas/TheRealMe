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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomThemes.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          backgroundColor: CustomThemes.primaryColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, Sabrine",
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: CustomThemes.black,
                      ),
                    ),
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(
                            '⭐️',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '345 pts',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CustomThemes.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
