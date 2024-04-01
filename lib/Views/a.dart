import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome_page extends StatelessWidget {
  const Welcome_page({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email_id_controller = TextEditingController();
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
        leading: Icon(Icons.arrow_back_ios_new_sharp),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Welcome to Ynotz Chat Application",
              style: TextStyle(
                  color: ColorsUsed.secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Create a new account",
              style: TextStyle(
                  color: ColorsUsed.secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email_id_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  labelStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  hintStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  hintText: "email",
                  labelText: "email"),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * .07,
            width: MediaQuery.sizeOf(context).width * .3,
            decoration: BoxDecoration(
                color: ColorsUsed.primaryColor,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
