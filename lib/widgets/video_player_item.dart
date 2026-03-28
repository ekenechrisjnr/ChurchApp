import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:dlcf_radio/api/streaming_json.dart';

class VideoPlayerItem extends StatefulWidget {
  final Streaming streaming;
  final bool autoPlay;
  final FlickManager? flickManager;

  const VideoPlayerItem({
    Key? key,
    required this.streaming,
    this.autoPlay = true,
    this.flickManager,
  }) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = widget.flickManager ??
        FlickManager(
          autoPlay: widget.autoPlay,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlickVideoPlayer(flickManager: flickManager),
        const SizedBox(
          height: 25,
        ),
        Text(
          widget.streaming.topic,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.streaming.preacher,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontStyle: FontStyle.italic,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.streaming.service,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 15,
              ),
        ),
      ],
    );
  }
}
