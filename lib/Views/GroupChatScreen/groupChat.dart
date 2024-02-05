import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/GroupChatScreen/appBarFroGroupChat.dart';
import 'package:flutter_application_1/widgets/chatBody.dart';
import 'package:flutter_application_1/widgets/messageBar.dart';

class GroupChat_Page extends StatefulWidget {
  final String subcategory;
  const GroupChat_Page({super.key, required this.subcategory});

  @override
  State<GroupChat_Page> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ChatBody(),
          AppbarForGroupChat(subcategory: widget.subcategory),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MessageBar(),
          ),
        ],
      ),
    );
  }
}
