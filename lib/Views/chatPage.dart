import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/chatPage/colorConstant.dart';
import 'package:flutter_application_1/Views/loginPage/colorConstant.dart';
import 'package:flutter_application_1/widgets/iconcreation.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({Key? key});

  @override
  _Chat_PageState createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  TextEditingController messageController = TextEditingController();
  int? _maxLines = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.grey,
        bottomOpacity: 5,
        backgroundColor: ColorsUsedChat.appBarcolor,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    child: Image.asset(
                  "assets/dp1.webp",
                  fit: BoxFit.fill,
                )))),
        title: Container(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Row(children: [
              Icon(
                Icons.circle,
                color: Colors.amber,
                size: 15,
              ),
              Spacer(),
              Text("Julie",
                  style: TextStyle(
                    color: ColorsUsedChat.bgcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ))
            ])),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.video_call,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.call,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.sizeOf(context).height,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset(
                      "assets/background_Image.jpg",
                    ),
                  );
                },
              )),
          Container(
            height: double.infinity,
            color: Color.fromARGB(212, 238, 227, 251),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder) => bottomsheet());
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsUsed.textfieldcolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: messageController,
                            maxLines: _maxLines,
                            keyboardType: TextInputType.multiline,
                            onChanged: (text) {
                              int lineCount = getLineCount(text);
                              setState(() {
                                if (lineCount <= 5) {
                                  _maxLines = null;
                                } else {
                                  _maxLines = 5;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: messageController.text.isEmpty
                          ? Icon(Icons.mic)
                          : Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getLineCount(String text) {
    return RegExp(r'\n').allMatches(text).length + 1;
  }

  Widget bottomsheet() {
    return Container(
      height: MediaQuery.sizeOf(context).height * .32,
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  iconcreation(
                      icon: Icons.insert_drive_file,
                      color: Color.fromARGB(255, 110, 103, 239),
                      text: "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      icon: Icons.camera_alt,
                      color: Color.fromARGB(255, 247, 106, 96),
                      text: "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      icon: Icons.image_rounded,
                      color: Colors.pink,
                      text: "Gallery"),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconcreation(
                        icon: Icons.headphones,
                        color: Colors.orange,
                        text: "Audio"),
                    SizedBox(
                      width: 40,
                    ),
                    iconcreation(
                        icon: Icons.contact_page,
                        color: Colors.blue,
                        text: "Contact"),
                    SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        margin: EdgeInsets.all(18),
      ),
    );
  }
}
