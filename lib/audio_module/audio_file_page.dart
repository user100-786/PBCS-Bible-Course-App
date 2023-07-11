import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';

class AddAudioPage extends StatefulWidget {
  const AddAudioPage({super.key});

  @override
  _AddAudioPageState createState() => _AddAudioPageState();
}

class _AddAudioPageState extends State<AddAudioPage> {
  File? _audioFile;

  Future<void> _pickAudio() async {
    // Use a file picker to let the user select an audio file
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);

    if (result != null) {
      setState(() {
        _audioFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _submitAudio() async {
    if (_audioFile != null) {
      // Upload the audio file to Firebase Storage
      String fileName = basename(_audioFile!.path);
      Reference audioRef =
          FirebaseStorage.instance.ref().child('audio/$fileName');
      await audioRef.putFile(_audioFile!);

      // Get the download URL for the audio file

      // String audioUrl = await audioRef.getDownloadURL();

      // // Add the download URL for the audio file to Firestore

      // DocumentReference docRef =
      //     FirebaseFirestore.instance.collection('Courses').doc('Course_01');
      // await docRef.set({'audio_one': audioUrl}, SetOptions(merge: true));

      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          const SnackBar(content: Text('Audio added to Firestore')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Audio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _pickAudio,
              icon: const Icon(Icons.audiotrack),
              label: const Text('Pick Audio'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _submitAudio,
              icon: const Icon(Icons.send),
              label: const Text('Submit Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
