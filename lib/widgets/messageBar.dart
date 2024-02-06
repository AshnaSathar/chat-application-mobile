import 'package:emoji_keyboard_flutter/emoji_keyboard_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/widgets/bottomSheet.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({super.key});

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  @override
  Widget build(BuildContext context) {
    int? _maxLines = 1;
    TextEditingController messageController = TextEditingController();

    return Container(
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
              color: ColorsUsed.secondaryIconColor,
            ),
            onPressed: () {
              EmojiBoard();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: ColorsUsed.secondaryIconColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (builder) => bottomsheet(context: context));
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
    );
  }

  int getLineCount(String text) {
    return RegExp(r'\n').allMatches(text).length + 1;
  }
}
