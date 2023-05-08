// import 'package:audio_cache/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// class MyAudioPlayer extends StatefulWidget {
//   final String audioPath;

//   const MyAudioPlayer({Key? key, required this.audioPath}) : super(key: key);

//   @override
//   State<MyAudioPlayer> createState() => _MyAudioPlayerState();
// }

// class _MyAudioPlayerState extends State<MyAudioPlayer> {
  
//   @override
//   Widget build(BuildContext context) {

//     return ElevatedButton(
//       onPressed: () async {
//         AudioCache audioCache = AudioCache();
//         await audioCache.play(widget.audioPath);
//       },
//       child: Text('Play Audio'),
//     );
//   }
// }
