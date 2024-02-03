import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/chatPage/chatcontent.dart';
import 'package:flutter_application_1/Views/chatPage/colorConstant.dart';
import 'package:flutter_application_1/Views/chatPage/roomContent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: ColorsUsedChat.appBarcolor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Image.asset(
                "assets/dp1.webp",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        actions: [Icon(Icons.more_vert)],
      ),
      backgroundColor: ColorsUsedChat.bgcolor,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Tab(
                        text: ' Chats',
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tab(text: 'Rooms'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  Chat_Content_Page(),
                  // Content of Tab 2
                  Rooms_Conten_Page(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
