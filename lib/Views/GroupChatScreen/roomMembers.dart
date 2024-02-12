import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/PersonalChatScreen/personalChatPage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';

class RoomMembers extends StatelessWidget {
  final String title;
  const RoomMembers({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBarForRoomMembers(context: context, title: this.title),
        RoomMemberBody(context: context)
      ]),
    );
  }
}

Widget RoomMemberBody({required context}) {
  return Flexible(
    child: Container(
      height: MediaQuery.sizeOf(context).height - .1,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          int i = index;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                height: MediaQuery.sizeOf(context).height * .1,
                width: MediaQuery.sizeOf(context).width * .15,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/dp1.webp",
                      fit: BoxFit.fill,
                    )),
              ),
              title: Text("Member $i"),
              trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Chat_Page(name: "Member $index"),
                        ));
                  },
                  child: Icon(
                    Icons.send,
                    color: ColorsUsed.primaryColor,
                  )),
            ),
          );
        },
      ),
    ),
  );
}

Widget AppBarForRoomMembers({required context, required String title}) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.1,
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
    child: Row(children: [
      InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_sharp)),
      Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      InkWell(
          onTap: () {
            // -------------------------------------functionality
          },
          child: Icon(Icons.more_vert)),
    ]),
  );
}
