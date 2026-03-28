import 'package:dlcf_radio/api/api.dart';
import 'package:flutter/material.dart';
import 'package:dlcf_radio/api/streaming_json.dart';
import 'package:dlcf_radio/widgets/video_player_item.dart';

class VideoPage extends StatefulWidget {
  static String routeName = 'VideoPage';
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  static const String pageName = "Video Streaming";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("$pageName Page"),
        backgroundColor: const Color.fromARGB(255, 6, 54, 94),
        centerTitle: true,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: FutureBuilder<List<Streaming>>(
        future: fetchStream(),
        builder: (BuildContext context, snapshot) {
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
          } else if (snapshot.data == null) {
            return const Center(
              child: Text('No Data Retrieved'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Streaming streaming = snapshot.data![index];
              return SafeArea(
                minimum: const EdgeInsets.only(
                  top: 100,
                  right: 0,
                  left: 0,
                  bottom: 0,
                ),
                child: SizedBox(
                  child: ListView(
                    children: [
                      VideoPlayerItem(streaming: streaming),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
