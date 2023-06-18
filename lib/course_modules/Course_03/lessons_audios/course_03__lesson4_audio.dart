import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course03Lesson04Audios extends StatefulWidget {
  const Course03Lesson04Audios({Key? key}) : super(key: key);

  @override
  State<Course03Lesson04Audios> createState() => _Course03Lesson04AudiosState();
}

class _Course03Lesson04AudiosState extends State<Course03Lesson04Audios> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_1.mp3?alt=media&token=b5f6a7f2-acc5-4296-80bf-c4fb4169edbc',
        label: 'Alif (bewa k betay ko zinda krna)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_2.mp3?alt=media&token=abf49bda-b1cd-4005-ba0d-8b21f99c754b',
        label: 'Aqwam-e-alam ke liye shifa aur zindagi ki barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_3.mp3?alt=media&token=e2b2cc6e-9656-4b45-a855-7ed785c26129',
        label: 'Bay (asaabi amraaz)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_4.mp3?alt=media&token=0ff7e288-bf00-412c-add8-22ee54eea8fc',
        label: 'Bay (yaier ki beti ko zinda krna)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_5.mp3?alt=media&token=0218459f-e23f-4c2e-a7ee-6fb12bde313a',
        label: 'Daal (Badroohon se rehai)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_6.mp3?alt=media&token=697586a2-789b-4751-9e86-a7c01fcdcbd0',
        label: 'Jeem (Lazar ko zinda krna'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_7.mp3?alt=media&token=011fd06c-ee84-47d1-b7f3-f5126101f4e5',
        label: 'Jeem (Napaki ka bais ban\'ne wali biimariyeo se rehai)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_8.mp3?alt=media&token=4d803d90-2341-4f0d-bfe9-336524157992',
        label: 'Seen (binayi aur goiyai ki bahali)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_9.mp3?alt=media&token=2a18a3ee-60fa-4f0a-b752-d497c92d84eb',
        label: 'Shifa ki barkat ( alif - tap)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_10.mp3?alt=media&token=eac2152c-9527-43d6-ac3e-3210aaac9bb9',
        label: 'shifa ki barkat ky baray anjeel muqqadas ki shadat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson04%2FAudio_11.mp3?alt=media&token=cfdbb7c0-2639-402c-82e6-1326b3430c72',
        label: 'zindagi ki barkat'),
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
