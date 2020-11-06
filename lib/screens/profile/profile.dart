import 'package:Tech_flutter/components/buttons/all.dart';
import 'package:Tech_flutter/components/forms/fields.dart';
import 'package:flutter/material.dart';
import 'package:Tech_flutter/firebase/utils/logout.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

Future<String> asyncRegister(
    String email,
    String password,
    BuildContext context,
    ) async {
  const String res = '';
//  final Result res =
//  await modifyUserWithEmailAndPassword(email: email, password: password);
//  if (res.success) {
//    Navigator.popUntil(context, ModalRoute.withName('/'));
//    Navigator.popAndPushNamed(context, '/authenticated');
//  }
//  return res.message;
  return res;
}

class _ProfilState extends State<Profil> {
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
      asyncRegister(
        emailController.text,
        passwordController.text,
        context,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.spacings.bodyPadding,
      child: Center(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              FittedBox(
                child: Text(
                  'Modify profil',
                  style: theme.texts.subtitle,
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
                          if (value != emailController.value.toString()) {
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
                        if (value != passwordController.value.toString()) {
                          return 'Password doesn\'t math';
                        }
                        return null;
                      },
                      hint: 'Confirm password',
                    ),
                    const SizedBox(height: 15.0),
                    PrimaryButton(
                      text: 'Modify',
                      onPressed: _validateForm,
                    ),
                    SecondaryButton(
                      text: 'Logout',
                      onPressed: () async {
                        await logout();
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName('/'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
