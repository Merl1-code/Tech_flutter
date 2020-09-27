import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/firebase/utils/credential_result.dart';
import 'package:Tech_flutter/firebase/utils/login.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

Future<String> asyncLogin(String email, String password) async {
  final Result res =
      await signInUserWithEmailAndPassword(email: email, password: password);
  print(res.message);
  return res.message;
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DAF9),
      body: Container(
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 80.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/images/illustration_login.svg',
                  ),
                ),
                const SizedBox(height: 60.0),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Adlery Pro',
                      fontSize: 65,
                      color: Color(0xFFB283FC)),
                ),
                const SizedBox(height: 10.0),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        cursorColor: Colors.white,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            color: Colors.white, height: 2, fontSize: 22),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB283FC), width: 2.0),
                            ),
                            fillColor: const Color(0xFFC2AEE2),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Colors.white, fontSize: 22, height: 0)),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        controller: passwordController,
                        cursorColor: Colors.white,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        style: const TextStyle(
                            color: Colors.white, height: 2.0, fontSize: 22),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB283FC), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            fillColor: const Color(0xFFC2AEE2),
                            filled: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                color: Colors.white, fontSize: 20, height: 0)),
                      ),
                      const SizedBox(height: 25.0),
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: RaisedButton(
                          elevation: 5.0,
                          padding: const EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate() != null) {
                              asyncLogin(emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          color: const Color(0xFFB283FC),
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
  }
}
