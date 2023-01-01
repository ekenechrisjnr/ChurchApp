import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:dlcf_radio/needed.dart';

class AudioPage extends StatefulWidget {
  static String routeName = 'AudioPage';

  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  static const String pageName = "Audio Streaming";
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setAudio();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // player.play(
    //   AssetSource(
    //     'assets/videos/vid.mp4',
    //   ),
    // );
  }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  Future setAudio() async {
    String url =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
    player.setSourceUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("$pageName Page"),
        backgroundColor: const Color.fromARGB(255, 6, 54, 94),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/splash.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'The Believers Guide To Living On Earth',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pastor Chris Nwabudike',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Sunday Worship Service',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15,
                      ),
                ),
                Slider(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);
                    await player.resume();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position),
                      ),
                      Text(
                        formatTime(duration - position),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  child: IconButton(
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle_outline_outlined
                          : Icons.play_circle_filled_outlined,
                    ),
                    iconSize: 35,
                    onPressed: () async {
                      if (isPlaying) {
                        await player.pause();
                      } else {
                        await player.resume();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
