import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Views/HomePage/allChats.dart';
import 'package:flutter_application_1/Views/colorConstant.dart';
import 'package:flutter_application_1/Views/HomePage/allRooms.dart';
import 'package:flutter_application_1/Views/subcategoryList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsedChat.bgcolor,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            HomePageAppbar(),
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
              child: Consumer(
                builder: (context, value, child) {
                  return TabBarView(
                    children: [
                      // Content of Tab 1
                      All_Chats_Page(),

                      // Content of Tab 2
                      Provider.of<ProviderClass>(context).changeRoomPageValue
                          ? SubcategoryList(
                              subcategoryname: Provider.of<ProviderClass>(
                                      context,
                                      listen: false)
                                  .subcategoryHeading)
                          : All_Rooms_Page()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageAppbar extends StatelessWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsUsedChat.appBarcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: MediaQuery.sizeOf(context).height * .1,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ]),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/dp1.webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                // -------------------------------------------settings functionality
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
