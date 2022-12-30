import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestationalage/Screens/SplashScree.dart';
import 'package:provider/provider.dart';

import 'Screens/View_Models/LMP_ViewModel.dart';

void main() {
  runApp( MultiProvider(
      providers: [

        ChangeNotifierProvider<LMP_ViewModel>(create: (_) => LMP_ViewModel()),
      ],
      child :const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  return  ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),

        //MyHomePage(),
      ),
      designSize: Size(428, 926),
    );


  }
}

