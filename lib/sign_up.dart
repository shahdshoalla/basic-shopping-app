import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Replace with your actual home screen file name

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    transitionDuration: Duration(milliseconds: 900),
  );
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              padding: EdgeInsets.all(16),

              width: MediaQuery.of(context).size.width * 0.5,
             decoration: BoxDecoration(
               color: Colors.white,
             ) ,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("sing up" ,style: TextStyle(
                    fontSize: 30
                  ),),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _nameCtrl,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'name'.tr()),
                    validator: (value) {
                      final t = (value ?? '').trim();
                      if (t.isEmpty) return 'Name required';
                      if (t[0] != t[0].toUpperCase()) return 'First letter must be uppercase';
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email'.tr()
                    ),
                    validator: (value) {
                    final v = (value ?? '').trim();
                    if (v.isEmpty) return 'Email required';
                    if (!v.contains('@')) return 'Email must include @';
                    return null;
                  },

                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'password'.tr()),
                    validator: (value){
                      final p = (value ?? '').trim();
                      if(p.isEmpty) return 'Password required' ;
                      if(p.length<6) return 'Password must be at least 6 characters';
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'confirmPass'.tr(),),
                    validator: (value){
                      final c = (value ?? '').trim();
                      if(c.isEmpty) return 'Confirm password required';
                      if (c != _passwordController.text.trim()) return 'Passwords do not match';
                    },
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: (){
                        if (_formkey.currentState!.validate()) {
                          _showMyDialog();
                        }
                      },
                      child: Text("Create Account"))
                ],

              ),
            ),
          ),
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
          title: Center(child: const Text('SUCCESS!')),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('Account created successfully')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  FadeRoute(page: HomeScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }


}
