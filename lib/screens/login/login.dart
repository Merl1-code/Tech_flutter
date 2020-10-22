import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/firebase/utils/credential_result.dart';
import 'package:Tech_flutter/firebase/utils/login.dart';
import 'package:Tech_flutter/components/buttons/primary.dart';
import 'package:Tech_flutter/components/forms/fields.dart';
import 'package:Tech_flutter/components/screen.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

Future<String> asyncLogin(
  String email,
  String password,
  BuildContext context,
) async {
  final Result res =
      await signInUserWithEmailAndPassword(email: email, password: password);
  if (res.success) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.popAndPushNamed(context, '/authenticated');
  }
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
    return Screen(
      backgroundColor: theme.colors.background,
      padding: const EdgeInsets.all(13),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 190,
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/illustration_login.svg',
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                FittedBox(
                  child: Text(
                    'Login',
                    style: theme.texts.title,
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
                      PrimaryButton(
                        text: 'Sign in',
                        onPressed: () {
                          if (_formKey.currentState.validate() != null) {
                            asyncLogin(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
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
                      style: TextStyle(
                        color: theme.colors.primary,
                      ),
                    ),
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, '/register'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
