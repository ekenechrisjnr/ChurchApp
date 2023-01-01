import 'package:dlcf_radio/api/api.dart';
import 'package:flutter/material.dart';
import 'package:dlcf_radio/api/streaming_json.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  static String routeName = 'VideoPage';
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  static const String pageName = "Video Streaming";
  //late FlickManager flickManager;

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
            return SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlickVideoPlayer(flickManager: flickManager),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            streaming.topic,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            streaming.preacher,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            streaming.service,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 15,
                                    ),
                          ),
                        ],
                      ),
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

late FlickManager flickManager;
late Streaming streaming;

@override
void initState() {
  //super.initState();
  flickManager = FlickManager(
    autoPlay: true,
    videoPlayerController: VideoPlayerController.network(
      streaming.url,
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: false,
        mixWithOthers: false,
      ),
    ),
  );
}

@override
void dispose() {
  flickManager.dispose();
  //super.dispose();
}
