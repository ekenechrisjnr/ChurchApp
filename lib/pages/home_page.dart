import 'package:dlcf_radio/front_pages/sermon_outline.dart';
import 'package:flutter/material.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:dlcf_radio/ads.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // BannerAd? _bannerAd;

  //@override
  // void initState() {
  //   BannerAd(
  //     adUnitId: Ads.bannerAdUnitId,
  //     request: const AdRequest(),
  //     size: AdSize.banner,
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           _bannerAd = ad as BannerAd;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, err) {
  //         debugPrint('Failed to load a banner ad: ${err.message}');
  //         ad.dispose();
  //       },
  //     ),
  //   ).load();
  // }

  //@override
  // void dispose() {
  //   // COMPLETE: Dispose a BannerAd object
  //   _bannerAd?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        heightFactor: 20.2,
        widthFactor: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'FEDERAL UNIVERSITY, DUTSIN-MA',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text('...achieving Heavens Goal'),
            ),
            const Divider(),
            Column(
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(2.95),
                    elevation: 5.58,
                    borderOnForeground: true,
                    shadowColor: Colors.lightBlue,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/about.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          'About The Church',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const AboutPage())),
                ),
                const Divider(),
                GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(2.95),
                    elevation: 5.58,
                    borderOnForeground: true,
                    shadowColor: Colors.lightBlue,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/sermon.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          'Sermon Outline',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const SermonOutline())),
                ),
                const Divider(),

                // if (_bannerAd != null)
                //   Align(
                //     alignment: Alignment.topCenter,
                //     child: SizedBox(
                //       width: _bannerAd!.size.width.toDouble(),
                //       height: _bannerAd!.size.height.toDouble(),
                //       child: AdWidget(ad: _bannerAd!),
                //     ),
                //   ),

                Card(
                  margin: const EdgeInsets.all(2.95),
                  elevation: 5.58,
                  borderOnForeground: true,
                  shadowColor: Colors.lightBlue,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/tithe.png',
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'Give Tithe / Offering',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Card(
                  margin: const EdgeInsets.all(2.95),
                  elevation: 5.58,
                  borderOnForeground: true,
                  shadowColor: Colors.lightBlue,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/announce.png',
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'Announcements',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Card(
                  margin: const EdgeInsets.all(2.95),
                  elevation: 5.58,
                  borderOnForeground: true,
                  shadowColor: Colors.lightBlue,
                  child: GestureDetector(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/video.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          'New Comers Form',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Future<InitializationStatus> _initGoogleMobileAds() {
//   // TODO: Initialize Google Mobile Ads SDK
//   return MobileAds.instance.initialize();
// }