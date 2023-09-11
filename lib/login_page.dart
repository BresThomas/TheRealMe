import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:radar_charts_app/theme.dart';
import 'package:radar_charts_app/utils.dart';

import 'forgot_password_page.dart';
import 'main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) => Material(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 34),
                ),
                SizedBox(height: 40),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 300), // Définissez la largeur maximale ici
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 300), // Définissez la largeur maximale ici
                  child: TextField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.lock_open),
                  label: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: signIn,
                ),
                SizedBox(height: 24),
                GestureDetector(
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    text: "No account ? ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'Sign Up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
