import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Views/PersonalChatScreen/appBarForSingleChat.dart';
import 'package:flutter_application_1/widgets/chatBody.dart';
import 'package:flutter_application_1/widgets/messageBar.dart';
import 'package:provider/provider.dart';

class Chat_Page extends StatefulWidget {
  final String name;
  const Chat_Page({Key? key, required this.name});

  @override
  _Chat_PageState createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderClass>(context).changeRoomPageValue = false;
    setState(() {});
    return Scaffold(
      body: Stack(
        children: [
          ChatBody(),
          Builder(
            builder: (BuildContext builderContext) {
              return AppbarContainer(
                title: widget.name,
              );
            },
          ),
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
