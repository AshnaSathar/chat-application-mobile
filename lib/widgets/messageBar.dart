// Import necessary libraries
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/widgets/bottomSheet.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({Key? key});

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  bool _emojiShowing = false;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  Icons.emoji_emotions,
                  color: Colors.amber,
                ),
                onPressed: () {
                  _toggleEmojiPicker();
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
                    builder: (builder) => bottomsheet(context: context),
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsUsed.textfieldcolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: GoogleFonts.notoColorEmoji(),
                      controller: messageController,
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
        if (_emojiShowing)
          EmojiPicker(
            config: Config(
                emojiTextStyle: GoogleFonts.notoColorEmoji(),
                categoryViewConfig:
                    CategoryViewConfig(showBackspaceButton: false),
                bottomActionBarConfig: BottomActionBarConfig(
                    buttonIconColor: Colors.black,
                    buttonColor: ColorsUsed.secondaryColor,
                    backgroundColor: ColorsUsed.secondaryColor,
                    showBackspaceButton: false),
                emojiViewConfig: EmojiViewConfig(
                  columns: 9,
                ),
                searchViewConfig: SearchViewConfig(buttonColor: Colors.black)),
            onEmojiSelected: (category, emoji) {
              setState(() {
                messageController.text += emoji.emoji;
              });
            },
          ),
      ],
    );
  }

  void _toggleEmojiPicker() {
    setState(() {
      _emojiShowing = !_emojiShowing;
    });
  }
}
