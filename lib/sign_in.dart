import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Sign in to ShopCart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'email'.tr(),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        final v = (value ?? '').trim();
                        if(v.isEmpty) return 'Please enter your email';
                        if(!v.contains('@')) return 'Please enter a valid email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'password'.tr(),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        final p = (value ?? '').trim();
                        if(p.isEmpty) return 'Please enter your password'; // Added empty check
                        if(p.length < 6) return 'Password must be at least 6 characters';
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()) {
                            _showMyDialog();
                          }
                        },
                        child: Text('Sign In')
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('Account sign-in successfully')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen() )
                );
              },
            ),
          ],
        );
      },
    );
  }
}