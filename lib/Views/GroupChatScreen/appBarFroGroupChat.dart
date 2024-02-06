import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/colorConstant.dart';
import 'package:flutter_application_1/Views/GroupChatScreen/roomMembers.dart';

class AppbarForGroupChat extends StatelessWidget {
  final String subcategory;
  const AppbarForGroupChat({Key? key, required this.subcategory})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.of(context).size.height * 0.1,
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
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/dp1.webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Icon(
            Icons.circle,
            size: 15,
            color: Colors.amber,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.subcategory,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Spacer(),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RoomMembers(title: this.subcategory),
                    ));
              },
              child: Icon(Icons.groups_2)),
          InkWell(child: Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
