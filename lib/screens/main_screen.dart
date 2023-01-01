import 'package:dlcf_radio/front_pages/sermon_outline.dart';
import 'package:dlcf_radio/pages/about_page.dart';
import 'package:dlcf_radio/pages/archive_page.dart';
import 'package:dlcf_radio/pages/audio_page.dart';
import 'package:flutter/material.dart';
import 'package:dlcf_radio/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../pages/video_page.dart';

class MainScreen extends StatefulWidget {
  static String routeName = 'MainScreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int i = 0;
  final screens = [
    const HomePage(),
    const AudioPage(),
    const VideoPage(),
    const ArchivePage(),
    const AboutPage(),
    const SermonOutline(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 20,
      ),
      const Icon(
        Icons.audio_file,
        size: 20,
      ),
      const Icon(
        Icons.live_tv,
        size: 20,
      ),
      const Icon(
        Icons.archive,
        size: 20,
      ),
    ];
    return Scaffold(
      body: screens[i],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: const Color.fromARGB(255, 6, 54, 94),
          animationCurve: Curves.bounceInOut,
          animationDuration: const Duration(milliseconds: 150),
          backgroundColor: Colors.black,
          items: items,
          height: 55,
          index: i,
          onTap: (index) => setState(() => i = index),
        ),
      ),
    );
  }
}
