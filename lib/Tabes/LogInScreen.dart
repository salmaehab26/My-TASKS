import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/CustomFormField.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 30, color: Color(0xff6750a4)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Note Application',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6750a4),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Welcome back! Please login to your account.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Container(
                width: 300.w,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      borderColor: Color(0xff6750a4),

                      hintText: 'Email address',
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      borderColor: Color(0xff6750a4),
                      controller: passwordController,
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final email = emailController.text.trim();

                  final password = passwordController.text.trim();
                  login(email, password, context);
                  // Navigator.of(context).pushReplacementNamed(homescreen.routeName);
                  // login(email, password, context);
                },
                child: Text("Log In"),
              ),
              SizedBox(height: 16),
              Text('Or'),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Signupscreen()),
                  // );
                },
                child: Text('Do not have an account? Register now'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
     await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pushReplacementNamed(homescreen.routeName);
    print("success");
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Login failed';
    }
  }
}
