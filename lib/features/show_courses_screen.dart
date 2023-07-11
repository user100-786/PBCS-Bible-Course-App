import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/constants/colors.dart';

class ShowCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: ExpansionPanelDemo(),
    );
  }
}

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> _books = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        backgroundColor: appPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _books[index].isExpanded = !isExpanded;
        });
      },
      children: _books.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text("Lesson-01"),
            );
          },
          body: ListTile(
            title: Text(
              "بیٹا جب اپ ایسے بڑے ہو جائو گے تو پتہ نہیں چلے گا کہ تمھیں میری کمپیوٹر پر یہ تحریر کیسے ملی۔ مجھے بھی اتنی خوشی ہوئی کہ میں نے اردو زبان میں تحریر کیا ۔ اس لئے میں نے سوچا کہ آپ کے لئے چند مثالیں بنا دوں تاکہ آپ کو اردو کا چند مزید آگاہی ہو سکے۔ ہم اسے کچھ آسان بنا سکتے ہیں اور تازہ ترین لفظوں اور جملوں کے ساتھ آپ کو پیش کرسکتے ہیں۔ چلیں، شروع کرتے ہیں:",
              textAlign: TextAlign.right,
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}
