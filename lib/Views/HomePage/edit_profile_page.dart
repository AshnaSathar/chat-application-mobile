import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/Controller/profile_updation_provider.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Edit_profile extends StatelessWidget {
  const Edit_profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobile_number_controller = TextEditingController();
    TextEditingController user_name_controller = TextEditingController();
    TextEditingController email_id_controller = TextEditingController();
    TextEditingController dob_controller = TextEditingController();
    TextEditingController gender_controller = TextEditingController();
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        elevation: 200,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorsUsed.secondaryColor,
          ),
        ),
        backgroundColor: ColorsUsed.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircleAvatar(
                maxRadius: 55,
                backgroundImage: NetworkImage(
                  "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "User name",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: ColorsUsed.secondaryColor,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Edit your profile",
              style: TextStyle(
                  fontSize: 18,
                  color: ColorsUsed.secondaryColor,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: user_name_controller,
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: dob_controller,
              decoration: InputDecoration(
                  hintText: "Date of birth",
                  hintStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gender_controller,
              decoration: InputDecoration(
                  hintText: "Gender",
                  hintStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: mobile_number_controller,
              decoration: InputDecoration(
                  hintText: "Mobile Number",
                  hintStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email_id_controller,
              decoration: InputDecoration(
                  hintText: "Email id",
                  hintStyle: TextStyle(color: ColorsUsed.secondaryColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsUsed.secondaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  if (user_name_controller.text.isNotEmpty &&
                      mobile_number_controller.text.isNotEmpty &&
                      gender_controller.text.isNotEmpty &&
                      email_id_controller.text.isNotEmpty &&
                      dob_controller.text.isNotEmpty) {
                    print(
                        "for check ${Provider.of<Login_provider>(context, listen: false).userName}");
                    bool status = await Provider.of<Profile_updation_provider>(
                            context,
                            listen: false)
                        .post_update_data(
                            context: context,
                            user_id: Provider.of<Login_provider>(context,
                                    listen: false)
                                .user_id,
                            user_name: Provider.of<Login_provider>(context,
                                    listen: false)
                                .userName,
                            new_user_name: user_name_controller.text,
                            token: Provider.of<Login_provider>(context,
                                    listen: false)
                                .token,
                            email_id:
                                Provider.of<Login_provider>(context, listen: false)
                                    .email_id,
                            new_email_id: email_id_controller.text,
                            dob: 25 - 01 - 2000,
                            new_dob: dob_controller.text);
                    if (status) {
                      print(true);
                    } else {
                      print(false);
                    }
                  }
                  // ===============
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: ColorsUsed.primaryColor,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: ColorsUsed.secondaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.sizeOf(context).height * .07,
                  width: MediaQuery.sizeOf(context).width * .4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
