import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:radar_charts_app/theme.dart';
import 'package:radar_charts_app/utils.dart';
import 'package:radar_charts_app/verify_email_page.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

import 'auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Demander l'autorisation pour les notifications
  var notificationStatus = await Permission.notification.request();
  if (notificationStatus.isGranted) {
    // Initialiser les notifications locales
    await initLocalNotificationsPlugin();
    await Firebase.initializeApp();

    // Planifier une notification quotidienne
    scheduleDailyNotification();
  } else {
    await Firebase.initializeApp();

    print('Permission de notification refusée.');
  }

  runApp(MyApp());
}

Future<void> initLocalNotificationsPlugin() async {
  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
}

Future<void> scheduleDailyNotification() async {
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'daily_notification',
    'Daily Notification',
    'This notification is for daily reminder',
    importance: Importance.max,
    priority: Priority.high,
  );

  const iOSPlatformChannelSpecifics = IOSNotificationDetails();

  final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  await FlutterLocalNotificationsPlugin().zonedSchedule(
    0,
    'Daily Notification',
    'Good Morning! It is time to start your day!',
    _nextInstanceOfNotificationTime(),
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}

late tz.Location _local;

tz.TZDateTime _nextInstanceOfNotificationTime() {
  tz.initializeTimeZones();
  _local = tz.local;
  final tz.TZDateTime now = tz.TZDateTime.now(_local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(_local, now.year, now.month, now.day, 9, 30);

  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }

  return scheduledDate;
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  static final String title = "Firebase Auth";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: title,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong !"),
            );
          } else if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
