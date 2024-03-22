import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/loginPage/password_change.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class Update_password extends StatefulWidget {
  final email_id;
  final user_name;
  const Update_password(
      {super.key, required this.user_name, required this.email_id});

  @override
  State<Update_password> createState() => _Update_passwordState();
}

class _Update_passwordState extends State<Update_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "We'll send you an OTP code via email.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: ColorsUsed.secondaryColor,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
          ),
          Text(
            "${widget.email_id}",
            style: TextStyle(
                color: ColorsUsed.secondaryColor,
                fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                ),
              )),
          Text(
            "${widget.user_name}",
            style: TextStyle(
                color: ColorsUsed.secondaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height * .3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "We sent an OTP to your email address. Enter that code to confirm your account.",
                              style: TextStyleConstants.textstyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsUsed.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: "OTP",
                                  hintText: "OTP"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Password_change(),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorsUsed.primaryColor),
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorsUsed.secondaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsUsed.secondaryColor,
                    border: Border.all(color: ColorsUsed.secondaryColor)),
                height: MediaQuery.sizeOf(context).height * .06,
                width: MediaQuery.sizeOf(context).width * .5,
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorsUsed.primaryColor,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorsUsed.primaryColor,
                  border: Border.all(color: ColorsUsed.secondaryColor)),
              height: MediaQuery.sizeOf(context).height * .06,
              width: MediaQuery.sizeOf(context).width * .5,
              child: Center(
                child: Text(
                  "Try Another Way",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorsUsed.secondaryColor,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
