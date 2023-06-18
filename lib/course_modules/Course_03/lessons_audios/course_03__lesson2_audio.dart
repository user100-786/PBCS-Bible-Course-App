import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course03Lesson02Audios extends StatefulWidget {
  const Course03Lesson02Audios({Key? key}) : super(key: key);

  @override
  State<Course03Lesson02Audios> createState() => _Course03Lesson02AudiosState();
}

class _Course03Lesson02AudiosState extends State<Course03Lesson02Audios> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson02%2FAudio_1.mp3?alt=media&token=2b43eb4d-0e67-4f26-82c4-cd31e86b02de',
        label: 'aman o salamti ki bahali k liye almaseeh ka kirdar'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson02%2FAudio_2.mp3?alt=media&token=5936d9e7-e984-4d5e-bf90-636fa0dd5426',
        label: 'aman o salamti ki barkat ki bahali'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson02%2FAudio_3.mp3?alt=media&token=a3f96a29-3ee2-4dad-a5a8-195732242fb8',
        label: 'aqwam-e-alam k liye aman o slamti ki barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson02%2FAudio_4.mp3?alt=media&token=fb04a3a6-d9a1-455d-a6a8-954a484d6be9',
        label: 'Bahmi muhabat ki ahmiyat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson02%2FAudio_5.mp3?alt=media&token=fa1ed47c-fa31-4fd0-aa78-3a5c64f6d94c',
        label: 'Insan aur khuda k talukat ki bahaali'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson02%2FAudio_6.mp3?alt=media&token=cc813c9e-75b1-438e-8976-aff62e004654',
        label: 'insano k bahmi talukaat ki bahali'),
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
          },
        ),
      ),
    );
  }
}
