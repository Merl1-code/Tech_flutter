import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/screens/register/register.dart';
import 'package:Tech_flutter/firebase/utils/credential_result.dart';
import 'package:Tech_flutter/firebase/utils/login.dart';
import 'package:Tech_flutter/components/buttons/primary.dart';
import 'package:Tech_flutter/components/forms/fields.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

Future<String> asyncLogin(String email, String password) async {
  final Result res =
      await signInUserWithEmailAndPassword(email: email, password: password);
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
              children: <Widget>[
                Container(
                  height: 230,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/images/illustration_login.svg',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      const FittedBox(
                        child: Text(
                          'Login',
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
                            EmailField(
                              controller: emailController,
                            ),
                            const SizedBox(height: 20.0),
                            PasswordField(
                              controller: passwordController,
                            ),
                            const SizedBox(height: 20.0),
                            MainButton(
                              text: 'Sign in',
                              onPressed: () {
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate() != null) {
                                  asyncLogin(emailController.text,
                                      passwordController.text);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          child: Text(
                            'sign up instead',
                            style: Theme.of(context).textTheme.overline,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement<
                                MaterialPageRoute<dynamic>, dynamic>(
                              context,
                              MaterialPageRoute<MaterialPageRoute<dynamic>>(
                                  builder: (BuildContext context) =>
                                      Register()),
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
