import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Container(
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 50.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Bù Lâ'pp",
                    style: TextStyle(fontFamily: 'Garineldo2', fontSize: 80,),
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: Image.network('https://img.icons8.com/plasticine/2x/idea.png', ),
                    backgroundColor: null,
                  ),
                  const SizedBox(height: 50.0),
                  const Text("Sign In",
                    style: TextStyle(fontSize: 35,),
                  ),
                  const SizedBox(height: 70.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email",
                          style: TextStyle(fontSize: 20.0,),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 0.0,
                          ),
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade300,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: null,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password",
                          style: TextStyle(fontSize: 20.0,),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 0.0,
                          ),
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade300,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: null,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFCF0FF),
              Color(0xFFF5CFFF),
            ],
          )
        ),
      ),
    );
  }
}
