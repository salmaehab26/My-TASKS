import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Tabes/LogInScreen.dart';
import 'firebase_options.dart';
import 'Tabes/home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});





  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
    builder: (context, child) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: homescreen.routeName,
        routes:{
          homescreen.routeName:(context) => LoginScreen(),


        });
  });
}}