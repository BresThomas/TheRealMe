import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radar_charts_app/breathing.dart';
import 'package:radar_charts_app/mood_tracker.dart';
import 'package:radar_charts_app/quiz_self-confidence.dart';
import 'package:radar_charts_app/radar_charts.dart';
import 'package:radar_charts_app/theme.dart';

import '../../home_page.dart';
import '../../page_not_found.dart';
import '../quiz/who_i_am.dart';
import 'widget_dashboard.dart';

class home_screen_phone extends StatelessWidget {
  const home_screen_phone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 15),
            child: Row(
              children: [
                Text(
                  "Your Feed",
                  style: GoogleFonts.montserrat(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: CustomThemes.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 15),
                child: Text(
                  "Your routine",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: CustomThemes.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 35, right: 35, bottom: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodSelectionRow()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  color: CustomThemes.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tracker mood',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: CustomThemes.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CustomThemes.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 15),
                child: Text(
                  "Your toolbox",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: CustomThemes.black,
                  ),
                ),
              ),
            ],
          ),
          DashboardCard(
            title: 'Mental Health',
            subtitle: 'Subtitle',
            completed: '2/4 completed',
            color: CustomThemes.pink,
            icon: Icons.arrow_forward_ios,
            routeName: PageNotFoundScreen(),
          ),
          DashboardCard(
            title: 'Productivity',
            subtitle: 'Subtitle',
            completed: '2/4 completed',
            color: CustomThemes.green,
            icon: Icons.arrow_forward_ios,
            routeName: PageNotFoundScreen(),
          ),
          DashboardCard(
            title: 'Who I Am',
            subtitle: 'Subtitle',
            completed: '2/4 completed',
            color: CustomThemes.yellow,
            icon: Icons.arrow_forward_ios,
            routeName: WhoIAmPage(title: 'Who I am'),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView scrollBarItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Naviguer vers la première page
            },
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFFF9F0),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notes, size: 48),
                  SizedBox(height: 16),
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2/4 completed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Naviguer vers la deuxième page
            },
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFFE7F3FF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notes, size: 48),
                  SizedBox(height: 16),
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2/4 completed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Naviguer vers la troisième page
            },
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFFECF8F0),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notes, size: 48),
                  SizedBox(height: 16),
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2/4 completed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
