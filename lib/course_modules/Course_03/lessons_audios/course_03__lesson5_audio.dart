import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course03Lesson05Audios extends StatefulWidget {
  const Course03Lesson05Audios({Key? key}) : super(key: key);

  @override
  State<Course03Lesson05Audios> createState() => _Course03Lesson05AudiosState();
}

class _Course03Lesson05AudiosState extends State<Course03Lesson05Audios> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_1.mp3?alt=media&token=52b58bf3-c664-444d-9aff-fe9d17eee446',
        label: 'Alif (maflooj ky gunah maf krna)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_2.mp3?alt=media&token=6265c62b-81c3-4c07-b18c-63be75a2091a',
        label: 'Alif (zakai ki zindagi mein tabdeeli)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_3.mp3?alt=media&token=57a659cc-3363-4014-a7f5-d3843be5d544',
        label: 'Alif (zakai ki zindagi mein tabdeeli)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_4.mp3?alt=media&token=7117bcc8-dcbd-471e-8437-aee9de8d63a2',
        label: 'Almaseeh ka zameen pr gunah maaf krne ka ikhtiyar'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_5.mp3?alt=media&token=4e6c7494-c02c-4693-a073-afcfcba02a9a',
        label: 'Aqwam-e-alam ke liye gunahon se nijat ky barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_6.mp3?alt=media&token=731efdb0-ea2b-4153-99e5-a0487ae8bf3a',
        label: 'Bay (Aik badchalan aurat k gunah maaf krna)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_7.mp3?alt=media&token=cf29f217-f753-4ed2-acc4-17cb767d6d2d',
        label: 'Bay (Aik zina kar aurat ky gunah maf krna)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_8.mp3?alt=media&token=7e649b82-e732-4b7e-9792-96c805b8dbb0',
        label: 'Bay (Matti ki zindagi mein tabdeeli)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_9.mp3?alt=media&token=f0a0983d-81e6-4068-a95a-e84f4f28b14f',
        label: 'Gunah se najat k liye elahi intezam'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_10.mp3?alt=media&token=3edcd227-bc67-4d6e-a9f0-6747d614a359',
        label: 'Gunah se najat ka mafhoom'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_11.mp3?alt=media&token=82e14818-a7f8-4605-a305-c5daf3bcff60',
        label: 'Insan ki zindagi mein gunah ka aagaz'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_12.mp3?alt=media&token=74b5d4e6-1ddd-43af-8b57-3e16559ec67c',
        label: 'Insani zindagi pr gunah ka asar'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson05%2FAudio_13.mp3?alt=media&token=41302a7e-3858-4e65-a010-49a5b7a133aa',
        label: 'Jeem (Saul ki zindagi mein tabdeeli)'),
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
