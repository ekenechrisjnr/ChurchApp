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
  Future<List<Streaming>>? _streamFuture;

  @override
  void initState() {
    super.initState();
    _streamFuture = fetchStream();
  }

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
        future: _streamFuture,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SafeArea(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueGrey,
                  color: Color.fromARGB(255, 6, 54, 94),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Retrieved'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return StreamItem(streaming: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}

class StreamItem extends StatefulWidget {
  final Streaming streaming;
  const StreamItem({required this.streaming, Key? key}) : super(key: key);

  @override
  State<StreamItem> createState() => _StreamItemState();
}

class _StreamItemState extends State<StreamItem> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.network(
        widget.streaming.url,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FlickVideoPlayer(flickManager: flickManager),
          ),
          const SizedBox(height: 25),
          Text(
            widget.streaming.topic,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            widget.streaming.preacher,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 5),
          Text(
            widget.streaming.service,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
