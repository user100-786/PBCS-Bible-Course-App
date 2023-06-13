import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../constants/colors.dart';

class Course01Audio extends StatefulWidget {
  const Course01Audio({super.key, required this.title});

  final String title;

  @override
  State<Course01Audio> createState() => _Course01Audio();
}

class _Course01Audio extends State<Course01Audio> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play(AssetSource('audio.mp3'));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // CircleAvatar(
                //   radius: 25,
                //   child: IconButton(
                //     icon:const Icon(Icons.stop),
                //     onPressed: (){
                //       player.stop();
                //     },
                //   ),
                // ),
                Text(formatTime(position.inSeconds)),
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) {
                    final position = Duration(seconds: value.toInt());
                    player.seek(position);
                    player.resume();
                  },
                ),
                Text(formatTime((duration - position).inSeconds)),
                // Container(
                //   padding: const EdgeInsets.all(20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(formatTime(position.inSeconds)),
                //       Text(formatTime((duration - position).inSeconds)),
                //     ],
                //   ),
                // ),
              ],
            ),
            // Slider(
            //   min: 0,
            //   max: duration.inSeconds.toDouble(),
            //   value: position.inSeconds.toDouble(),
            //   onChanged: (value) {
            //     final position = Duration(seconds: value.toInt());
            //     player.seek(position);
            //     player.resume();
            //   },
            // ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(formatTime(position.inSeconds)),
            //       Text(formatTime((duration - position).inSeconds)),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}