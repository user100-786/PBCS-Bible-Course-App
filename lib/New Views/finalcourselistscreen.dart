import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/New%20Views/course2_exoansion_panel.dart';
import 'package:pbcs_bible_course/New%20Views/expandedbody.dart';
import 'package:pbcs_bible_course/constants/colors.dart';
// stores ExpansionPanel state information
class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  List<List<String>> dataList = [
    ['Introduction','Lesson 01','Lesson 02','Lesson 03','Lesson 04','Lesson 05'],
    ['intro'],
    ['Introduction','Lesson 01','Lesson 02','Lesson 03','Lesson 04','Lesson 05']
  ];
  int courseNo=0;
  final refDB = FirebaseDatabase.instance.ref('courses');
  final List<Item> _data = generateItems(3);
  String courseName = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text('Courses'),
        backgroundColor: appPrimaryColor,
        //actions: [
          // GestureDetector(
          //   onTap: () => _fontSizeModelBottomSheet(context),
          //   child: const Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: Icon(
          //       Icons.more_vert,
          //       size: 28,
          //     ),
          //   ),
          // )],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }
  Widget _decision(){
    if(courseNo == 1) {
      return Course2ExpansionPanel(courseNo: courseNo,courseName: courseName,);
    }
      return ExpandableBody(dataList: dataList, courseNo: courseNo , courseName: courseName,);
  }
  Widget _buildPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ExpansionPanelList(
        expansionCallback: (int pIndex, bool isExpanded) {
          setState(() {
            _data[pIndex].isExpanded = !isExpanded;
            courseNo = pIndex;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ListTile(
                  title: Text(item.headerValue,style: const TextStyle(fontSize: 18),),
                contentPadding: const EdgeInsets.only(top: 15,left: 15,right: 15),
                ),
              );
            },
            body: _decision(),
            isExpanded: !item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = true,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Course ${index+1}',
      expandedValue: '',
    );
  });
}
