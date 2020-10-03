import 'package:Tech_flutter/components/buttons/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/firebase/utils/credential_result.dart';
import 'package:Tech_flutter/firebase/utils/register.dart';
import 'package:Tech_flutter/components/forms/fields.dart';

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

  void _validateForm() {
    if (_formKey.currentState.validate() != null &&
        emailController.text == verifEmailController.text &&
        passwordController.text == verifPasswordController.text) {
      asyncRegister(emailController.text, passwordController.text);
    }
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
                            EmailField(
                              controller: emailController,
                            ),
                            const SizedBox(height: 15.0),
                            EmailField(
                                controller: verifEmailController,
                                validator: (String value) {
                                  if (value !=
                                      emailController.value.toString()) {
                                    return 'Emails doesn\'t match';
                                  }
                                  return null;
                                },
                                hint: 'Confirm Email'),
                            const SizedBox(height: 15.0),
                            PasswordField(
                              controller: passwordController,
                            ),
                            const SizedBox(height: 15.0),
                            PasswordField(
                              controller: verifPasswordController,
                              validator: (String value) {
                                if (value !=
                                    passwordController.value.toString()) {
                                  return 'Password doesn\'t math';
                                }
                                return null;
                              },
                              hint: 'Confirm password',
                            ),
                            const SizedBox(height: 15.0),
                            MainButton(
                              text: 'Sign up',
                              onPressed: _validateForm,
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
                            Navigator.pushReplacement<
                                MaterialPageRoute<dynamic>, dynamic>(
                              context,
                              MaterialPageRoute<MaterialPageRoute<dynamic>>(
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
