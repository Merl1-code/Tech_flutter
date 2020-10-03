import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/firebase/utils/credential_result.dart';
import 'package:Tech_flutter/firebase/utils/register.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    return RegisterState();
  }
}

Future<String> asyncRegister(String email, String password) async {
  final Result res =
      await createUserWithEmailAndPassword(email: email, password: password);
  return res.message;
}

class RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifEmailController = TextEditingController();
  final TextEditingController verifPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    verifEmailController.dispose();
    verifPasswordController.dispose();
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
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/images/illustration_inscription.svg',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      const FittedBox(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontFamily: 'Adlery Pro',
                              fontSize: 50,
                              color: Color(0xFFB283FC)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: TextFormField(
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
                                    color: Colors.white,
                                    height: 1.5,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
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
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 1.5)),
                              ),
                              height: 50,
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              child: TextFormField(
                                controller: verifEmailController,
                                cursorColor: Colors.white,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    color: Colors.white,
                                    height: 1.5,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
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
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Confirm Email',
                                    hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 2.5)),
                              ),
                              height: 50,
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              height: 50,
                              child: TextFormField(
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
                                    color: Colors.white,
                                    height: 1.5,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
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
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 2.5)),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              height: 50,
                              child: TextFormField(
                                controller: verifPasswordController,
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
                                    color: Colors.white,
                                    height: 1.5,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
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
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Confirm password',
                                    hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 2.5)),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: RaisedButton(
                                elevation: 0,
                                padding: const EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
                                  if (_formKey.currentState.validate() !=
                                          null &&
                                      emailController.text ==
                                          verifEmailController.text &&
                                      passwordController.text ==
                                          verifPasswordController.text) {
                                    asyncRegister(emailController.text,
                                        passwordController.text);
                                  }
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                                color: const Color(0xFFB283FC),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          child: const Text(
                            'sign in instead',
                            style: TextStyle(
                              color: Color(0xFFB283FC),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement<MaterialPageRoute,
                                dynamic>(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Login()),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
