import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course03Lesson01Audios extends StatefulWidget {
  const Course03Lesson01Audios({Key? key}) : super(key: key);

  @override
  State<Course03Lesson01Audios> createState() => _Course03Lesson01AudiosState();
}

class _Course03Lesson01AudiosState extends State<Course03Lesson01Audios> {
  List<AudioPlayer> players = [];
  List<bool> isPlayingList = [];
  List<Duration> durationList = [];
  List<Duration> positionList = [];

  String formatTime(int seconds) {
    return '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');
  }

  List<AudioFile> audioFiles = [
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_1.mp3?alt=media&token=a908a065-d4ea-4612-a61d-e6b0675a7521',
        label: 'almaseeh ki waladat-e-aqdas'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_2.mp3?alt=media&token=29b154e3-c82e-44a5-9b58-ecaa8c7c7a67',
        label: 'aqwam e alam k liye barkat ka waada'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_3.mp3?alt=media&token=ff8818cd-3a3f-4e2c-a4f6-d2702a71e176',
        label: 'Asmani farishto k nagmaat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_4.mp3?alt=media&token=fcf0c51a-3a32-48b4-bf42-cc3f733f57cd',
        label: 'Hasil e kalam'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_5.mp3?alt=media&token=8c50dfe0-b15f-4e87-adc2-c9b21663fb57',
        label: 'Hazrat jibareel ki maarfat muqadsa mariam ko paigam'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_6.mp3?alt=media&token=a93a5691-6a5b-4026-aaa1-4fd03e3e0506',
        label: 'Masharki zaireen aur asman pr ajeeb sitaray ka zahoor'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson01%2FAudio_7.mp3?alt=media&token=d7dfd5fe-6a49-4e60-9194-cf4ca9c46792',
        label: 'Masharki zaireen aur asman pr ajeeb sitaray ka zahoor')
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
      players[index].play(UrlSource(audioFiles[index].filePath));
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
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        audioFile.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ]),
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
