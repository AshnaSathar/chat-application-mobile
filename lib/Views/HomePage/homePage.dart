import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/all_users_provider.dart';
import 'package:flutter_application_1/Controller/friendship_provider.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/Views/HomePage/allChats.dart';
import 'package:flutter_application_1/Views/HomePage/allRooms.dart';
import 'package:flutter_application_1/Views/HomePage/profile_page.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      Provider.of<All_users_provider>(context, listen: false).getUsers(
          token: Provider.of<Login_provider>(context, listen: false).token);
      await Provider.of<Friendship_provider>(context, listen: false)
          .get_friends(
              user_id:
                  Provider.of<Login_provider>(context, listen: false).user_id,
              token: Provider.of<Login_provider>(context, listen: false).token);
    } catch (error) {
      print("error is $error");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.secondaryColor,
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

                      All_Rooms_Page()
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
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        color: ColorsUsed.appBarcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: height * .1,
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile_page(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ]),
                height: height * 0.15,
                width: width * 0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/dp1.webp",
                    fit: BoxFit.fill,
                  ),
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
                color: ColorsUsed.secondaryIconColor,
              ))
        ],
      ),
    );
  }
}
