import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Course_01/course_01_audio.dart';

class ModelBottomSheet extends StatefulWidget {
  const ModelBottomSheet({super.key});

  @override
  State<ModelBottomSheet> createState() => _ModelBottomSheetState();
}

class _ModelBottomSheetState extends State<ModelBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          builder: (context) => Container(
            padding: const EdgeInsets.fromLTRB(0,30,0,30),
            child: const Course01Audio(),
            // child: const Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [Text('Audio Files here...')],
            // ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: const Text('Listen in Audio'),
    );
  }
}
