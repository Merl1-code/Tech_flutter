import 'package:Tech_flutter/Firebase/utils/credentialResult.dart';
import 'package:Tech_flutter/screens/Register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tech_flutter/Firebase/utils/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

Future<String> asyncLogin(String email, String password) async {
  final Result res = await signInUserWithEmailAndPassword(
      email: email, password: password);
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
                  vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    height: 230,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/images/illustration_login.svg',),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 50.0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                      const SizedBox(height: 20.0),
                      const FittedBox(
                        child: Text('Login',
                          style: TextStyle(fontFamily: 'Adlery Pro', fontSize: 50, color: Color(0xFFB283FC)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
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
                                style: const TextStyle(color: Colors.white, height: 1.5, fontSize: 16),
                                decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(color: Colors.red, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(color: Color(0xFFB283FC), width: 2.0),
                                    ),
                                    fillColor: const Color(0xFFC2AEE2),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5)
                                ),
                              ),
                              height: 65,
                            ),
                            const SizedBox(height: 25.0),
                            Container(
                              height: 60,
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
                                style: const TextStyle(color: Colors.white, height: 1.5, fontSize: 16),
                                decoration: InputDecoration(

                                    focusedErrorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(color: Colors.red, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(color: Color(0xFFB283FC), width: 2.0),
                                    ),
                                    fillColor: const Color(0xFFC2AEE2),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5)
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Container(
                              width: double.infinity,
                              height: 60,
                              child: RaisedButton(
                                elevation: 0,
                                padding: const EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
                                  if (_formKey.currentState.validate() != null) {
                                    asyncLogin(emailController.text, passwordController.text);
                                  }
                                },
                                child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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
                          child: const Text('sign up instead',
                            style: TextStyle(
                              color: Color(0xFFB283FC),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push<MaterialPageRoute>(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => Register()),
                            );
                          },
                        ),
                      )
                    ],),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
