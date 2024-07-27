import 'package:flutter/material.dart';
import 'package:dlcf_radio/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.routeName, (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  //cacheHeight: 100,
                  //cacheWidth: 100,
                  'assets/images/splash.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'DLCF FUDMA',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                      ),
                ),
                Text(
                  '...achieving Heavens Goal',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  softWrap: true,
                  '<b> Chris-Jnr Ekene Nwabudike </b>',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
