import 'package:Tech_flutter/Firebase/utils/credentialResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tech_flutter/Firebase/utils/register.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    return RegisterState();
  }
}

Future<String> asyncRegister(String email, String password) async {
  final Result res = await createUserWithEmailAndPassword(
      email: email, password: password);
  print(res.message);
  print('oui');
  return res.message;
}

class RegisterState extends State<Register> {

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
      backgroundColor: Colors.purple.shade50,
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
                children: <Widget> [
                  const Text("Bù Lâ'pp",
                    style: TextStyle(fontFamily: 'Garineldo2', fontSize: 80,),
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: Image.network('https://img.icons8.com/plasticine/2x/idea.png', ),
                    backgroundColor: null,
                  ),
                  const SizedBox(height: 70.0),
                  Form(
                    key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                const Text('Email',
                                  style: TextStyle(fontSize: 20.0,),
                                ),
                                const SizedBox(height: 10.0),

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
                                  style: const TextStyle(color: Colors.white, height: 2.0),
                                  decoration: InputDecoration(
                                      fillColor: Colors.purple,
                                      filled: true,
                                      border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      prefixIcon: const Icon(Icons.mail_outline,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Enter your email',
                                      hintStyle: const TextStyle(color: Color.fromARGB(150, 255, 255, 255))
                                  ),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                const Text('Password',
                                  style: TextStyle(fontSize: 20.0,),
                                ),
                                const SizedBox(height: 10.0),
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
                                  style: const TextStyle(color: Colors.white, height: 2.0),
                                  decoration: InputDecoration(
                                      fillColor: Colors.purple,
                                      filled: true,
                                      border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      prefixIcon: const Icon(Icons.lock,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle: const TextStyle(color: Color.fromARGB(150, 255, 255, 255))
                                  ),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          RaisedButton(

                            elevation: 5.0,
                            padding: const EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              if (_formKey.currentState.validate() != null) {
                                asyncRegister(emailController.text, passwordController.text);
                              }
                            },
                            child: const Text('Register', style: TextStyle(color: Colors.white),),
                            color: Colors.purple.shade800,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color> [
              Color(0xFFFCF0FF),
              Color(0xFFF5CFFF),
            ],
          )
        ),
      ),
    );
  }
}
