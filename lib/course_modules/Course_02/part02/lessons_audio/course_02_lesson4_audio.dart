import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course02Part02Lesson04Audio extends StatefulWidget {
  const Course02Part02Lesson04Audio({Key? key}) : super(key: key);

  @override
  State<Course02Part02Lesson04Audio> createState() =>
      _Course02Part02Lesson04AudioState();
}

class _Course02Part02Lesson04AudioState
    extends State<Course02Part02Lesson04Audio> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F1.mp3?alt=media&token=767c7f9f-cd8a-4882-983e-8f730ef0f564',
        label: 'Aseeri k bad k nabi (Hazrat Zakriya)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F2.mp3?alt=media&token=ac44e443-ae1f-4fcf-8754-29ac4c84ecaa',
        label: 'Aseeri k zamana k nabi (Hazrat Daniel)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F3.mp3?alt=media&token=ab0dd78d-d2ee-4013-87a4-162293505cac',
        label: 'Aseeri se kabal k nabi (Hazrat Yermiah)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F4.mp3?alt=media&token=b43d272f-2f16-47b4-8614-ce517d2d57d9',
        label: 'Aseeri se qabal k nabi (Hazrat Micah)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F5.mp3?alt=media&token=aa16c1a8-4113-47c4-970f-1a1f6c03373f',
        label: 'Bani Israel ka zawal awr khuda ki muhabat (Hissa Doum)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F6.mp3?alt=media&token=cb3cbe81-037e-40eb-8845-b2f69fdcdaf4',
        label: 'Dua'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F7.mp3?alt=media&token=41d7e09c-f666-4383-b351-745adadfea7a',
        label: 'Janoobi Saltanat (Bani yahooda ka anjmaa)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F8.mp3?alt=media&token=6ed897ca-d489-4db7-857f-8376c5317f20',
        label: 'Janoobi saltanat k ambia ka paigam'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F9.mp3?alt=media&token=a8a5d290-9175-4417-9190-bb00e1db0108',
        label: 'Janoobi saltanat k ambia karam'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F10.mp3?alt=media&token=4cb7122a-9e34-4a4c-853e-dbf57c7a6b79',
        label: 'Janoobi saltanat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F11.mp3?alt=media&token=91d0a80e-dd84-4bb2-a39b-b6c1dfd6b255',
        label: 'Sabaq ka khulasa'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart02%2FLesson04%2F12.mp3?alt=media&token=828493b5-4488-4d45-8372-045666f83ce4',
        label: 'Zaman aseeri se qabal k ambia'),
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
