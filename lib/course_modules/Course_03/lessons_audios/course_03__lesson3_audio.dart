import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course03Lesson03Audios extends StatefulWidget {
  const Course03Lesson03Audios({Key? key}) : super(key: key);

  @override
  State<Course03Lesson03Audios> createState() => _Course03Lesson03AudiosState();
}

class _Course03Lesson03AudiosState extends State<Course03Lesson03Audios> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_1.mp3?alt=media&token=8007cb35-a8bf-4e88-a90b-520375c93333',
        label: 'Aik shadi mein wasail par barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_2.mp3?alt=media&token=73d1c157-36b3-439d-9f99-a53792a7f3a4',
        label: 'Almaseeh k waseela barkaat hasil krne ka bhaid'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_3.mp3?alt=media&token=9caead38-2ec2-42dd-b741-0609db9608d7',
        label: 'Almaseeh ki hosla afza taleemat aur daway'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_4.mp3?alt=media&token=674a05c7-f34b-453c-b371-ec53381e87dc',
        label: 'Aqwam-e-alam k liye khushali ki barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_5.mp3?alt=media&token=1890fa8a-a209-47b1-8968-3a02be771837',
        label: 'Mayoos kun lamhat mein barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_6.mp3?alt=media&token=5240c55c-2a88-410b-95a2-4376704eb313',
        label: 'Mehdood wasail pr barhoti ki barkat'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse03%2FLesson03%2FAudio_7.mp3?alt=media&token=40c9379e-1fe0-46dd-bc79-36d12688da29',
        label: 'wasail ko tabah krne wale anasir pr galba'),
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
