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
            subtitle: '2/4 completed',
            color: CustomThemes.pink,
            icon: Icons.arrow_forward_ios,
            routeName: PageNotFoundScreen(),
          ),
          DashboardCard(
            title: 'Productivity',
            subtitle: '2/4 completed',
            color: CustomThemes.green,
            icon: Icons.arrow_forward_ios,
            routeName: PageNotFoundScreen(),
          ),
          DashboardCard(
            title: 'Who I Am',
            subtitle: '2/4 completed',
            color: CustomThemes.yellow,
            icon: Icons.arrow_forward_ios,
            routeName: WhoIAmPage(title: 'Who I am'),
          ),
        ],
      ),
    );
  }
}
