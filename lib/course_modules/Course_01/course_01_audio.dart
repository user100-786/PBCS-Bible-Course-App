import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late String url;
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('Courses').doc('Course_01');

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  Future<String> _getAudioUrl() async {
    final audioRef =
        FirebaseStorage.instance.ref().child('audio/audio_one.mp3');
    final url = await audioRef.getDownloadURL();
    await docRef.set({'audio_one': url}, SetOptions(merge: true));
    return url;
  }

  Future<void> _play() async {
  url = await _getAudioUrl();
  await audioPlayer.setSourceUrl(url);
  await audioPlayer.play(UrlSource(url));
  setState(() {
    isPlaying = true;
  });
}


  Future<void> _pause() async {
    await audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Audio Player'),
            const SizedBox(height: 16),
            PlayerWidget(
              isPlaying: isPlaying,
              onPlay: _play,
              onPause: _pause,
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  final bool isPlaying;
  final Future<void> Function() onPlay;
  final VoidCallback onPause;

  const PlayerWidget({
    Key? key,
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
      onPressed: isPlaying ? onPause : () async {
        await onPlay();
      },
    );
  }
}

