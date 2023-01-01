import 'package:flutter/material.dart';

class SermonOutline extends StatefulWidget {
  static String routeName = 'SermonOutline';

  const SermonOutline({Key? key}) : super(key: key);

  @override
  State<SermonOutline> createState() => _SermonOutlineState();
}

class _SermonOutlineState extends State<SermonOutline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 54, 94),
        title: const Text('Outline'),
      ),
      body: const Center(
        child: SizedBox(
          child: Text('Sermon Outline Page'),
        ),
      ),
    );
  }
}
