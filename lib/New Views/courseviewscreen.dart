import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pbcs_bible_course/New%20Views/Lesson.dart';

import '../constants/colors.dart';
import '../course_modules/Course_02/part01/lessons_audio/Course02Taurf.dart';
class CourseScreen extends StatefulWidget {
  final String text;
  final String title;
  final String lessonNo;
  const CourseScreen({super.key, required this.text, required this.title, required this.lessonNo});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  String val = '';
  final FirebaseFirestore fireStoreDB = FirebaseFirestore.instance;
  int currentAudioIndex = 0;
  List<AudioFile> audioFiles = [
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F1.mp3?alt=media&token=813732ca-7c4e-455b-9a02-b5d73419ff68',
        label: '1.2 taruf paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F2.mp3?alt=media&token=04721954-dcf0-4dec-b6ea-d152eb1712d3',
        label: '3.2 khaliq-e-kainat paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F3.mp3?alt=media&token=cc55102d-90a1-4206-bd01-0c9daecc08cd',
        label: '4.2 qadr-e-mutalik khuda paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F4.mp3?alt=media&token=abec99e4-b585-49c6-be5b-ce3ea9b77666',
        label: '5.2 wahid ul lashareek khuda paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F5.mp3?alt=media&token=25e66e5f-3bd1-4984-aab1-14863c6f6480',
        label: '6.1 Khuda taala aik paak zaat'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F6.mp3?alt=media&token=1c1273f0-66a5-4869-bbd2-75811f805b24',
        label: '7.1 Raheem o kareem khuda'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F7.mp3?alt=media&token=d77304cd-b45f-4288-bf52-4eb9f50c40c9',
        label: '8.2 parwardigar paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F8.mp3?alt=media&token=9800436d-37f1-4bfa-9037-03273de337e4',
        label: '9.2 muhafiz-e-kainat paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F8.mp3?alt=media&token=9800436d-37f1-4bfa-9037-03273de337e4',
        label: '10.2 rab-ul-alamin paragraph'),
    AudioFile(
        filePath:
        'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2F8.mp3?alt=media&token=9800436d-37f1-4bfa-9037-03273de337e4',
        label: '11.2 seekhne ki baat paragraph L1'),
  ];
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  List<LessonModel> course1 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: () async{
          if(isPlaying){
            await audioPlayer.pause();
            isPlaying = false;
            setState(() {
            });
          }
          Navigator.pop(context);
        },),
        backgroundColor: appPrimaryColor,
        title: Text("${widget.title} ${widget.lessonNo}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * .02,),
            FutureBuilder(
                future: GetSetData(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .4,),
                        Center(
                          child: CircularProgressIndicator(
                            color: appPrimaryColor,
                          ),
                        )
                      ],
                    );
                  }
                  else{
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(val,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                    );
                  }
                }
                )
          ],
        ),
      ),
    );
  }

  Future<void> GetSetData() async {
    DocumentSnapshot documentSnapshot =
    await fireStoreDB.collection(widget.title).doc(widget.lessonNo).get();
    val = documentSnapshot['content'];
  }


  // void playAudios() async {
  //   if (isPlaying) {
  //     await audioPlayer.pause();
  //     setState(() {
  //       isPlaying = false;
  //     });
  //   } else {
  //     setState(() {
  //       isPlaying = true;
  //     });
  //     await audioPlayer.setUrl(audioFiles[0].filePath);
  //     await audioPlayer.play();
  //     audioPlayer.playerStateStream.listen((playerState) {
  //       if (playerState.processingState == ProcessingState.completed) {
  //         playNextAudio();
  //       }
  //     });
  //   }
  // }
  // void playNextAudio() async {
  //   if (currentAudioIndex < audioFiles.length - 1) {
  //     currentAudioIndex++;
  //   } else {
  //     currentAudioIndex = 0;
  //   }
  //   await audioPlayer.setUrl(audioFiles[currentAudioIndex].filePath);
  //   await audioPlayer.play();
  // }
}



// audio play button
// Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       //playAudios();
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: appPrimaryColor,
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       height: MediaQuery
//                           .of(context)
//                           .size
//                           .height * .06,
//                       width: MediaQuery
//                           .of(context)
//                           .size
//                           .width * .15,
//                       child: Center(
//                           child: Icon(isPlaying? Icons.pause : Icons.play_arrow)
//                       ),
//                     ),
//                   ),
//                 ],
//               ),