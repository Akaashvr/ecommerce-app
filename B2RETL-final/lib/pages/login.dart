import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String err = "";
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  singIn(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Navigator.pushNamed(
        context,
        '/dashboard',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          err = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          err = 'Wrong password provided for that user.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  'assets/png/logo-no-background.png',
                  width: 250,
                ),
                const Text("Your business slogan"),
                const SizedBox(height: 20),
                Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Center(
                          child: Text(err,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red)),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(
                              context,
                              '/forget',
                            )
                          },
                          child: const Text(
                            'Forget password? Click',
                            style: TextStyle(
                                color: Color(0xff0718c3),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        const SizedBox(height: 34),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              // const v = _formKey.currentState?.validate();
                              var verify = _formKey.currentState?.validate();
                              if (verify != null && verify == true) {
                                try {
                                  await singIn(
                                      emailAddress: _emailController.text,
                                      password: _passwordController.text,
                                      context: context);
                                } catch (e) {}
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              // Navigator.pop();
                              Navigator.pushNamed(
                                context,
                                '/signup',
                              );
                            },
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: const Text(
                                "I don't have account? Sign up",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
