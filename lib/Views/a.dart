import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controller/otp.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/registerPage.dart';
import 'package:flutter_application_1/widgets/show_model_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  _Welcome_pageState createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  TextEditingController email_id_controller = TextEditingController();
  TextEditingController confirm_email_id = TextEditingController();
  TextEditingController otp_controller = TextEditingController();
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
        leading: Icon(Icons.arrow_back_ios_new_sharp),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                children: [
                  Text(
                    "Welcome to Ynotz Chat Application",
                    style: TextStyle(
                        color: ColorsUsed.secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.montserrat().fontFamily),
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
                ],
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: email_id_controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ColorsUsed.secondaryColor)),
                            labelStyle:
                                TextStyle(color: ColorsUsed.secondaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsUsed.secondaryColor)),
                            hintStyle:
                                TextStyle(color: ColorsUsed.secondaryColor),
                            hintText: "email",
                            labelText: "email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: confirm_email_id,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ColorsUsed.secondaryColor)),
                            labelStyle:
                                TextStyle(color: ColorsUsed.secondaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsUsed.secondaryColor)),
                            hintStyle:
                                TextStyle(color: ColorsUsed.secondaryColor),
                            hintText: "confirm your email",
                            labelText: "confirm your email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, right: 8.0, left: 8.0, top: 50.0),
                      child: InkWell(
                        onTap: () async {
                          if (email_id_controller.text.isEmpty) {
                            show_bottom_sheet(
                                context: context,
                                data_to_display: "Enter your email_id");
                          } else {
                            if (confirm_email_id.text.isEmpty) {
                              show_bottom_sheet(
                                  context: context,
                                  data_to_display:
                                      "You must re enter your email_id for confirmation");
                            } else {
                              if (email_id_controller.text ==
                                  confirm_email_id.text) {
                                if (emailValid
                                    .hasMatch(email_id_controller.text)) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  bool success =
                                      await Provider.of<Otp_provider>(context,
                                              listen: false)
                                          .Send_otp(
                                              email: email_id_controller.text);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  if (success) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Check you gmail",
                                                  style: TextStyle(
                                                      color: ColorsUsed
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 14,
                                                      fontFamily: GoogleFonts
                                                              .montserrat()
                                                          .fontFamily),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "We had sent an OTP to your gmail. please check it and enter here.",
                                                  style: TextStyle(
                                                      color: ColorsUsed
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 14,
                                                      fontFamily: GoogleFonts
                                                              .montserrat()
                                                          .fontFamily),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextField(
                                                  controller: otp_controller,
                                                  decoration: InputDecoration(
                                                      hintText: "OTP",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          borderSide: BorderSide(
                                                              color: ColorsUsed
                                                                  .primaryColor))),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  bool success = true;
                                                  if (otp_controller
                                                      .text.isEmpty) {
                                                    show_bottom_sheet(
                                                        context: context,
                                                        data_to_display:
                                                            "Enter OTP");
                                                  } else {
                                                    if (success) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                RegisterPage(
                                                              email:
                                                                  email_id_controller
                                                                      .text,
                                                            ),
                                                          ));
                                                    } else {
                                                      show_bottom_sheet(
                                                          context: context,
                                                          data_to_display:
                                                              "OTP entered is wrong");
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .07,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .3,
                                                  child: Center(
                                                    child: Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: ColorsUsed
                                                              .primaryColor,
                                                          fontFamily: GoogleFonts
                                                                  .montserrat()
                                                              .fontFamily),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorsUsed
                                                              .primaryColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              3,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        );
                                      },
                                    );
                                  } else {
                                    show_bottom_sheet(
                                        context: context,
                                        data_to_display:
                                            "check your email id and try again");
                                  }
                                } else {
                                  show_bottom_sheet(
                                      context: context,
                                      data_to_display: "Invalid email format");
                                }
                              } else {
                                show_bottom_sheet(
                                    context: context,
                                    data_to_display:
                                        "Both fields must be identical");
                              }
                            }
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .3,
                          child: Center(
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: ColorsUsed.secondaryColor,
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily),
                                  ),
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorsUsed.secondaryColor),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
