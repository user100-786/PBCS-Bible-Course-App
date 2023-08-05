import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pbcs_bible_course/constants/colors.dart';
import 'package:pbcs_bible_course/provider/font_size_provider.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:provider/provider.dart';

class ExpansionPanelDemo extends StatefulWidget {
  final String pdfUrl =
      "https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_01%2FTLPP%20Text%20only%20Unicode%20complete.pdf?alt=media&token=34b78844-4a7b-4d37-9330-7691be96a41d";

  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> _books = generateItems(1);
  String _docText = '';
  bool _isLoading = true;
  late double _fontSize;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String formattedText = "";

  @override
  void initState() {
    fetchFormattedText();
    super.initState();
  }

  Future<void> fetchFormattedText() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final DocumentSnapshot snapshot =
        await firestore.collection('Course01').doc('Lesson01').get();

    if (snapshot.exists) {
      formattedText = snapshot['content'];
    } else {
      formattedText = 'Error in loading the text';
    }
  }

  @override
  Widget build(BuildContext context) {
    _fontSize = Provider.of<FontSizeProvider>(context).fontSize;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text('Courses'),
        backgroundColor: appPrimaryColor,
        actions: [
          GestureDetector(
            onTap: () => _fontSizeModelBottomSheet(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                size: 28,
              ),
            ),
          )
        ],
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
            return const ListTile(
              title: Text(
                "Course 01",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar-Regular',
                  fontSize: 16,
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
            child:
                // _isLoading
                //     ? const CircularProgressIndicator()
                //     :
                Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Text(
                    formattedText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gulzar-Regular',
                      fontSize: _fontSize,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void _fontSizeModelBottomSheet(BuildContext context) {
    double fontSize =
        Provider.of<FontSizeProvider>(context, listen: false).fontSize;

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              color: Color(0xF2F5F9FF),
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Change font size',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF272D37),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_outlined,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    margin: const EdgeInsets.only(left: 45),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Text(
                          "ہم خط و کتابت کورس ”خُدا کی وفاداری : حصہ اوّل“ آپ کی خدمت میں پیش کرتے ہوئے بہت زیادہ خوشی محسوس کر رہے ہیں۔اُمید ہے کہ اِس کے مطالعہ سے آپ کو بہت زیادہ برکت ملے گی۔",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gulzar-Regular',
                            fontSize: fontSize,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 24),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      child: Slider(
                        thumbColor: appPrimaryColor,
                        activeColor: appPrimaryColor,
                        value: fontSize,
                        min: 14.0,
                        max: 18.0,
                        onChanged: (newValue) {
                          setState(() {
                            fontSize = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  // SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    width: 327,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: appPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // set font size saved provider here
                        Provider.of<FontSizeProvider>(context, listen: false)
                            .fontSize = fontSize;
                        // Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'This is an empty bottom sheet!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
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
