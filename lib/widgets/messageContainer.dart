import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageContainer extends StatelessWidget {
  final String msg;
  const MessageContainer({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    print("called");
    return Container(
      height: 50,
      width: 100,
      color: Colors.blue,
      child: Text(
        this.msg,
        style: GoogleFonts.aBeeZee(color: Colors.white),
      ),
    );
  }
}
