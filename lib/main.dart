import 'package:flutter/material.dart';
import 'package:dlcf_radio/routes.dart';
//import 'package:dlcf_radio/ads.dart';
//import 'package:provider/provider.dart';
import 'package:dlcf_radio/screens/splash_screen.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: true,
      title: 'DLCF FUDMA RADIO',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.grey,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
