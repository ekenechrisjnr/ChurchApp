import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static String routeName = 'AboutPage';

  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  //int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color.fromARGB(255, 6, 54, 94),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  height: 80,
                  width: 70,
                ),
                Text(
                  'About DLCF FUDMA',
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Divider(
                  thickness: 0.9,
                ),
                Text(
                  //softWrap: true,
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.24,
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dustin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.'
                  'Deeper Life Campus Fellowship, Federal University, Dutsin-Ma,'
                  'Was founded on the 2nd of August 2012.',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
