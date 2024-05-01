//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'CustomFormField.dart';
//
// class Signupscreen extends StatelessWidget {
//   // final TextEditingController emailController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();
//   // final TextEditingController repasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 30, color: Color(0xff6750a4)),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//
//             children: [
//               Text(
//                 'Note Application',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff6750a4),
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Text(
//                 'Welcome! Please create account.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 width: 300.w,
//                 child: Column(
//                   children: [
//                     CustomTextFormField(
//                       // controller: emailController,
//                       borderColor: Color(0xff6750a4),
//
//                       hintText: 'Email address',
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     SizedBox(height: 16),
//                     CustomTextFormField(
//                       borderColor: Color(0xff6750a4),
//                       // controller: passwordController,
//                       hintText: 'Enter your password',
//                       prefixIcon: Icon(Icons.lock),
//                       suffixIcon: Icon(Icons.visibility),
//                     ),
//                     SizedBox(height: 16),
//
//                     CustomTextFormField(
//                       borderColor: Color(0xff6750a4),
//                       // controller: passwordController,
//                       hintText: 'Enter your re-password',
//                       prefixIcon: Icon(Icons.lock),
//                       suffixIcon: Icon(Icons.visibility),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 8),
//
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   // final email = emailController.text.trim();
//                   // final password = passwordController.text.trim();
//
//                 },
//                 child: Text("Sign Up"),
//               ),
//               SizedBox(height: 16),
//               Text('Or'),
//               SizedBox(height: 16),
//               TextButton(
//                 onPressed: () {},
//                 child: Text('Have account ?'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );}}