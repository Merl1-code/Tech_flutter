import 'dart:io';

import 'package:Tech_flutter/components/buttons/all.dart';
import 'package:Tech_flutter/components/forms/fields.dart';
import 'package:flutter/material.dart';
import 'package:Tech_flutter/firebase/utils/logout.dart';
import 'package:Tech_flutter/firebase/utils/update.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

Future<String> asyncModifyEmail(String email) async {
  final String res =
  await updateEmail(email);
  return res;
}

Future<String> asyncModifyPassword(String password) async {
  final String res =
  await updatePassword(password);
  return res;
}

class _ProfilState extends State<Profil> {
  File _image;
  final picker = ImagePicker();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifEmailController = TextEditingController();
  final TextEditingController verifPasswordController = TextEditingController();

  String modifyPasswordString = '';
  String modifyEmailString = '';

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
    if (_formKey.currentState.validate() != null) {
      if (emailController.text == verifEmailController.text && emailController.value.text.isNotEmpty)
        asyncModifyEmail(emailController.text).then((String value) => setState(() {
          modifyEmailString = value;
        }));
      if (passwordController.text == verifPasswordController.text && passwordController.value.text.isNotEmpty)
        asyncModifyPassword(passwordController.text).then((String value) => setState(() {
          modifyPasswordString = value;
        }));
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.spacings.bodyPadding,
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: _image == null
                    ? const Text('No image selected.')
                    : Image.file(_image),
              ),
              Button(
                onPressed: getImage, text: 'photo',
              ),
              FittedBox(
                child: Text(
                  'Modify Email',
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
                      textColor: Colors.white,
                      backgroundColor: theme.colors.background,
                      validator: (String value) {
                        if (value.isEmpty && passwordController.value.text.isEmpty) {
                          return 'Please enter an email';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value) && value.isNotEmpty) {
                          return 'Email is incorrect';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    EmailField(
                      controller: verifEmailController,
                      validator: (String value) {
                        if (value != emailController.value.text) {
                          return 'Emails doesn\'t match';
                        }
                        return null;
                      },
                      hint: 'Confirm Email',
                      textColor: Colors.white,
                      backgroundColor: theme.colors.background,
                    ),
                    const SizedBox(height: 25.0),
                    FittedBox(
                      child: Text(
                        'Modify password',
                        style: theme.texts.subtitle,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    PasswordField(
                      controller: passwordController,
                      textColor: Colors.white,
                      backgroundColor: theme.colors.background,
                      validator: (String value) {
                        if (value.isEmpty && emailController.value.text.isEmpty) {
                          return 'Please enter a valid password';
                        } else if (value.length < 8 && value.isNotEmpty) {
                          return 'Password should be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    PasswordField(
                      controller: verifPasswordController,
                      validator: (String value) {
                        if (value != passwordController.value.text) {
                          return 'Password doesn\'t math';
                        }
                        return null;
                      },
                      hint: 'Confirm password',
                      textColor: Colors.white,
                      backgroundColor: theme.colors.background,
                    ),
                    const SizedBox(height: 15.0),
                    PrimaryButton(
                      text: 'Modify',
                      onPressed: _validateForm,
                    ),
                    Button(
                      text: 'Logout',
                      onPressed: () async {
                        await logout();
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName('/'),
                        );
                      },
                      backgroundColor: theme.colors.background,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 15.0),
                    Text(modifyEmailString,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    ),
                    Text(modifyPasswordString,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
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
