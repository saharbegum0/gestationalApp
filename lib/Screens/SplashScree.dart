import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestationalage/Screens/HomeScreen.dart';

import '../Core/Constant/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),

            ()=>Navigator.pushReplacement(context,

            MaterialPageRoute(builder:

                (context) =>
                    HomeScreen()

            )

        )

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Center(
              child: SizedBox(height: 167,
                  width: 166,
              child: Image.asset("assets/images/logo.png"),
              ),
            ),
              SizedBox(height: 10,),
              const Text("Gestation",style: TextStyle(color: Colors.white,fontSize: 15),)
          ],),
        ));
  }
}
