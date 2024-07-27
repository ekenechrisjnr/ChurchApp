import 'package:flutter/material.dart';
import 'package:dlcf_radio/api/api.dart';
import 'package:dlcf_radio/api/archive_json.dart';

class ArchivePage extends StatefulWidget {
  static String routeName = 'ArchivePage';

  const ArchivePage({Key? key}) : super(key: key);

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  static const String pageName = "Archive";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("$pageName Page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 54, 94),
      ),
      body: FutureBuilder<List<Archive>>(
        // RETURN FUTURE BUILDER FROM THE FETCH ARCHIVE LIST
        future: fetchArchive(),
        builder: (BuildContext context, snapshot) {
          // IF INTERNET CONNECTION IS SLOW OR CONTENT IS STILL LOADING...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.blueGrey,
                        color: Color.fromARGB(255, 6, 54, 94),
                      ),
                    ],
                  ),
                ],
              ),
            );
            //RETURN A CIRCULAR LOADING BAR
          }

          // RETURN THIS IF THE TABLE IN THE DATABASE IS EMPTY WITH NO CONTENT...
          else if (snapshot.hasData == false) {
            return const SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.no_encryption_gmailerrorred_rounded,
                        color: Colors.blueAccent,
                        size: 100,
                      ),
                      Text(
                        "No Content On Database",
                        style: TextStyle(
                            fontSize: 18.65, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          // END OF RETURN THIS IF THE TABLE IN THE DATABASE IS EMPTY WITH NO CONTENT...
          else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // RETURN ICON AND TEXT IF THERE IS NO INTERNET CONNECTION
                      const Icon(
                        Icons.signal_wifi_connected_no_internet_4_outlined,
                        size: 14.5,
                        textDirection: TextDirection.ltr,
                        color: Colors.blueAccent,
                        semanticLabel: "No Internet Connection",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        softWrap: true,
                        ''' No Internet Connection...
                          Consider Connecting To WiFi or Using Mobile Data
                          ''',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            );
            // END OF NO INTERNET CONNECTION FOR ARCHIVE PAGE..
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Archive archive = snapshot.data![index];
              return Card(
                borderOnForeground: true,
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/splash.png',
                      cacheWidth: 40,
                      cacheHeight: 40,
                      width: 45,
                      height: 45,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          archive.vidtitle,
                          softWrap: true,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              inherit: true,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          //textAlign: TextAlign.center,
                          archive.subtitle,
                          //style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          'Click Me!',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
