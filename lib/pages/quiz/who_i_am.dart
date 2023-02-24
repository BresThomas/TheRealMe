import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../page_not_found.dart';
import '../../quiz_personality.dart';
import '../../quiz_self-confidence.dart';
import '../../radar_charts.dart';
import '../../theme.dart';
import '../home_screen/widget_dashboard.dart';

class WhoIAmPage extends StatelessWidget {
  final String title;

  const WhoIAmPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardCard(
              title: 'Self Confident',
              subtitle: '2/4 completed',
              color: CustomThemes.pink,
              icon: Icons.arrow_forward_ios,
              routeName: QuizApp_selfConfident(),
            ),
            DashboardCard(
              title: 'Personality Quiz',
              subtitle: '2/4 completed',
              color: CustomThemes.green,
              icon: Icons.arrow_forward_ios,
              routeName: QuizApp(),
            ),
            DashboardCard(
              title: 'Result',
              subtitle: '2/4 completed',
              color: CustomThemes.yellow,
              icon: Icons.arrow_forward_ios,
              routeName: RadarChartsPage(),
            ),
          ],
        ));
  }
}
