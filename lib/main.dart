import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:radar_charts_app/theme.dart';
import 'package:radar_charts_app/utils.dart';
import 'package:radar_charts_app/verify_email_page.dart';
import 'auth_page.dart';
import 'home_page.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBgSQLGFf4KzGGI64C6FPe1tka3kFUTCxQ",
          authDomain: "the-real-me-82bd9.firebaseapp.com",
          databaseURL:
              "https://the-real-me-82bd9-default-rtdb.europe-west1.firebasedatabase.app",
          projectId: "the-real-me-82bd9",
          storageBucket: "the-real-me-82bd9.appspot.com",
          messagingSenderId: "339454277073",
          appId: "1:339454277073:web:60b48789d6add6933f5cf0"));
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
