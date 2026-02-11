import 'package:dlcf_radio/front_pages/sermon_outline.dart';
import 'package:dlcf_radio/pages/about_page.dart';
import 'package:dlcf_radio/pages/archive_page.dart';
import 'package:dlcf_radio/pages/audio_page.dart';
import 'package:dlcf_radio/pages/home_page.dart';
import 'package:dlcf_radio/pages/video_page.dart';
import 'package:dlcf_radio/screens/main_screen.dart';
import 'package:dlcf_radio/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  HomePage.routeName: (context) => const HomePage(),
  AboutPage.routeName: (context) => const AboutPage(),
  ArchivePage.routeName: (context) => const ArchivePage(),
  AudioPage.routeName: (context) => const AudioPage(),
  VideoPage.routeName: (context) => const VideoPage(),
  SermonOutline.routeName: (context) => const SermonOutline(),
};