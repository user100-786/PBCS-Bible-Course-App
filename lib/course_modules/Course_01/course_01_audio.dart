// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import '../../constants/colors.dart';

// class Course01Audio extends StatefulWidget {
//   const Course01Audio({super.key});

//   @override
//   State<Course01Audio> createState() => _Course01Audio();
// }

// class _Course01Audio extends State<Course01Audio> {
//   final player = AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   String formatTime(int seconds) {
//     return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
//   }

//   @override
//   void initState() {
//     super.initState();

//     player.onPlayerStateChanged.listen((state) {
//       setState(() {
//         isPlaying = state == PlayerState.playing;
//       });
//     });

//     player.onDurationChanged.listen((newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });

//     player.onPositionChanged.listen((newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   child: IconButton(
//                     icon: Icon(
//                       isPlaying ? Icons.pause : Icons.play_arrow,
//                     ),
//                     onPressed: () {
//                       if (isPlaying) {
//                         player.pause();
//                       } else {
//                         player.play(AssetSource('audio.mp3'));
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(formatTime(position.inSeconds)),
//                 Slider(
//                   min: 0,
//                   max: duration.inSeconds.toDouble(),
//                   value: position.inSeconds.toDouble(),
//                   onChanged: (value) {
//                     final position = Duration(seconds: value.toInt());
//                     player.seek(position);
//                     player.resume();
//                   },
//                 ),
//                 Text(formatTime((duration - position).inSeconds)),
//                 // Container(
//                 //   padding: const EdgeInsets.all(20),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       Text(formatTime(position.inSeconds)),
//                 //       Text(formatTime((duration - position).inSeconds)),
//                 //     ],
//                 //   ),
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course01Audio extends StatefulWidget {
  const Course01Audio({Key? key}) : super(key: key);

  @override
  State<Course01Audio> createState() => _Course01AudioState();
}

class _Course01AudioState extends State<Course01Audio> {
  List<AudioPlayer> players = [];
  List<bool> isPlayingList = [];
  List<Duration> durationList = [];
  List<Duration> positionList = [];

  String formatTime(int seconds) {
    return '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');
  }

  List<AudioFile> audioFiles = [
    AudioFile(filePath: 'audio.mp3', label: 'Audio 1 Label'),
    AudioFile(filePath: 'audio.mp3', label: 'Audio 2 Label'),
    AudioFile(filePath: 'audio.mp3', label: 'Audio 3 Label'),
    AudioFile(filePath: 'audio.mp3', label: 'Audio 4 Label'),
    AudioFile(filePath: 'audio.mp3', label: 'Audio 5 Label'),
    AudioFile(filePath: 'audio.mp3', label: 'Audio 6 Label'),
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < audioFiles.length; i++) {
      final player = AudioPlayer();
      players.add(player);
      isPlayingList.add(false);
      durationList.add(Duration.zero);
      positionList.add(Duration.zero);

      players[i].onPlayerStateChanged.listen((state) {
        setState(() {
          isPlayingList[i] = state == PlayerState.playing;
        });
      });

      players[i].onDurationChanged.listen((newDuration) {
        setState(() {
          durationList[i] = newDuration;
        });
      });

      players[i].onPositionChanged.listen((newPosition) {
        setState(() {
          positionList[i] = newPosition;
        });
      });
    }
  }

  void playAudio(int index) {
    if (!isPlayingList[index]) {
      players[index].play(AssetSource(audioFiles[index].filePath));
    } else {
      players[index].pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: audioFiles.length,
          itemBuilder: (BuildContext context, int index) {
            final audioFile = audioFiles[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: MaterialPrimaryColor,
                  child: IconButton(
                    icon: Icon(
                      isPlayingList[index] ? Icons.pause : Icons.play_arrow,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        playAudio(index);
                      });
                    },
                  ),
                ),
                title: Center(
                  child: Text(
                    audioFile.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Slider(
                      activeColor: MaterialPrimaryColor,
                      inactiveColor: MaterialPrimaryColor.withOpacity(0.5),
                      min: 0,
                      max: durationList[index].inSeconds.toDouble(),
                      value: positionList[index].inSeconds.toDouble(),
                      onChanged: (value) {
                        final position = Duration(seconds: value.toInt());
                        players[index].seek(position);
                      },
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(positionList[index].inSeconds)),
                        Text(formatTime(
                            (durationList[index] - positionList[index])
                                .inSeconds)),
                      ],
                    ),
                  ],
                ),
              ),
            );
            // return Column(
            //   children: [
            //     Text(audioFile.label),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         CircleAvatar(
            //           radius: 20,
            //           child: IconButton(
            //             icon: Icon(
            //               isPlayingList[index]
            //                   ? Icons.pause
            //                   : Icons.play_arrow,
            //             ),
            //             onPressed: () {
            //               setState(() {
            //                 playAudio(index);
            //               });
            //             },
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Text(formatTime(positionList[index].inSeconds)),
            //         Slider(
            //           min: 0,
            //           max: durationList[index].inSeconds.toDouble(),
            //           value: positionList[index].inSeconds.toDouble(),
            //           onChanged: (value) {
            //             final position = Duration(seconds: value.toInt());
            //             players[index].seek(position);
            //           },
            //         ),
            //         Text(formatTime(
            //             (durationList[index] - positionList[index]).inSeconds)),
            //       ],
            //     ),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
