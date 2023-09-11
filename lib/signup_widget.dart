import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:radar_charts_app/theme.dart';
import 'package:radar_charts_app/utils.dart';
import 'main.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final countryController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    countryController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: 300), // Définissez la largeur maximale ici
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 34),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "First Name",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length == 0
                        ? "Enter your first name"
                        : null,
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length == 0
                        ? "Enter your last name"
                        : null,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? "Enter a valid email"
                            : null,
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? "Enter min. 6 characters"
                        : null,
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      } else if (value!.length < 6) {
                        return "Enter min. 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: countryController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Country",
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? "Enter your country"
                        : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.arrow_forward),
                    label: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: signUp,
                  ),
                  SizedBox(height: 24),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                      text: "Already have an account ? ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: 'Log In',
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
        ),
      );

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordController.text != confirmPasswordController.text) {
      Utils.showSnackBar('Passwords do not match');
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = authResult.user;
      final uid = user!.uid;
      final email = user.email;
      final timestamp = DateTime.now().toIso8601String();
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final country = countryController.text.trim();

      final userData = {
        'email': email,
        'timestamp': timestamp,
        'firstName': firstName,
        'lastName': lastName,
        'country': country,
        'result': [0, 0, 0, 0, 0, 0],
      };

      await FirebaseDatabase.instance
          .ref()
          .child('users')
          .child(uid)
          .set(userData);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
