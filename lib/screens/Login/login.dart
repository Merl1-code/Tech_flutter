import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;

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
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    cursorColor: Colors.white,
                                    obscureText: true,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(color: Colors.white, height: 2.0),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 14.0),
                                      prefixIcon: Icon(Icons.mail_outline,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(color: Color.fromARGB(150, 255, 255, 255))
                                    ),
                                  ),
                                )
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
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    cursorColor: Colors.white,
                                    obscureText: true,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    style: const TextStyle(color: Colors.white, height: 2.0),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 14.0),
                                      prefixIcon: Icon(Icons.lock,
                                      color: Colors.white,
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(color: Color.fromARGB(150, 255, 255, 255))
                                    ),
                                  ),
                                )
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
                                // If the form is valid, display a Snackbar.
                              }
                            },
                            child: const Text('Sign in', style: TextStyle(color: Colors.white),),
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
