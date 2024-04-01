import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/loginPage/loginPage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:google_fonts/google_fonts.dart';

class Try_another_page extends StatefulWidget {
  const Try_another_page({Key? key}) : super(key: key);

  @override
  _Try_another_pageState createState() => _Try_another_pageState();
}

class _Try_another_pageState extends State<Try_another_page> {
  int? groupValue;

  List<String> optionsTitle = [
    // "Get code or link via WhatsApp",
    "Confirm via SMS",
    "Get code or link via email",
    "Enter password to log in"
  ];
  int? item;
  TextEditingController email_controller = TextEditingController();
  TextEditingController otp_controller = TextEditingController();
  TextEditingController mobile_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
                "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
          ),
          Text(
            "Name",
            style: TextStyle(
              color: ColorsUsed.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
          Text(
            "Choose a way to log in : ",
            style: TextStyle(
              color: ColorsUsed.secondaryColor,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: optionsTitle.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RadioListTile<int>(
                  activeColor: ColorsUsed.secondaryColor,
                  value: index,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                      item = value;
                    });
                  },
                  title: Text(
                    optionsTitle[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
            child: InkWell(
              onTap: () {
                if (item != null) {
                  alertBox(data: item);
                } else {
                  bottom_sheet(
                    data: "Please select an option",
                    context: context,
                  );
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                  color: ColorsUsed.secondaryColor,
                  border: Border.all(color: ColorsUsed.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorsUsed.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> alertBox({required int? data}) async {
    String title = "";
    String subTitle = "";
    String field = "";

    switch (data) {
      // case 0:
      //   title = "Get code or link via WhatsApp";
      //   subTitle = "XXXXXXXX81";
      //   field = "phone";
      //   break;
      case 0:
        title = "Confirm via SMS";
        subTitle = "XXXXXXXX81";
        field = "phone";
        break;
      case 1:
        title = "Get code via email";
        subTitle = "************@gmail.com";
        field = "email";
        break;
      case 2:
        title = "Are you sure? This will navigate you to login page.";
        break;
      default:
        bottom_sheet(data: "Select one", context: context);
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: ColorsUsed.primaryColor,
                fontSize: 18,
                fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                    color: ColorsUsed.primaryColor,
                    fontSize: 16,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              if (field == "phone")
                TextFormField(
                  controller: mobile_controller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryColor)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Confirm your mobile number",
                      hintStyle: TextStyle(
                          color: ColorsUsed.primaryColor,
                          fontSize: 12,
                          fontFamily: GoogleFonts.montserrat().fontFamily)),
                ),
              if (field == "email")
                TextFormField(
                  controller: email_controller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryColor)),
                      hintStyle: TextStyle(color: ColorsUsed.primaryColor),
                      hintText: "Confirm your email"),
                ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                switch (data) {
                  // case 0:
                  //   if (mobile_controller.text.isEmpty) {
                  //     Navigator.pop(context);
                  //     bottom_sheet(
                  //         data: "phone number can't be null", context: context);
                  //   } else {
                  //     Navigator.pop(context);
                  //     if (mobile_controller.text
                  //         .contains(RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$'))) {
                  //       bottom_sheet_OTP(
                  //           context: context,
                  //           email: mobile_controller.text,
                  //           via: "phone number");
                  //     } else {
                  //       bottom_sheet(
                  //           data: "Invalid mobile number", context: context);
                  //     }
                  //   }
                  //   break;
                  case 0:
                    if (mobile_controller.text.isEmpty) {
                      Navigator.pop(context);
                      bottom_sheet(
                          data: "phone number can't be null", context: context);
                    } else {
                      Navigator.pop(context);
                      if (mobile_controller.text
                          .contains(RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$'))) {
                        bottom_sheet_OTP(
                            context: context,
                            email: mobile_controller.text,
                            via: "phone number");
                      } else {
                        bottom_sheet(
                            data: "Invalid mobile number", context: context);
                      }
                    }
                    break;
                  case 1:
                    if (email_controller.text.isEmpty) {
                      Navigator.pop(context);
                      bottom_sheet(
                          data: "email id cant be null", context: context);
                    } else if (email_controller.text.contains(RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      Navigator.pop(context);

                      bottom_sheet_OTP(
                          via: "email",
                          context: context,
                          email: email_controller.text);
                    } else {
                      bottom_sheet(data: "Invalid email!!", context: context);
                    }
                    break;
                  case 2:
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  default:
                    bottom_sheet(data: "Select one", context: context);
                }
                mobile_controller.clear();
                email_controller.clear();
              },
              child: Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  Future bottom_sheet({required data, required context}) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.sizeOf(context).height * .15,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    data,
                    style: TextStyle(
                        color: ColorsUsed.primaryColor,
                        fontSize: 18,
                        fontFamily: GoogleFonts.montserrat().fontFamily),
                  )),
                ),
                Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  color: ColorsUsed.secondaryColor,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                          height: MediaQuery.sizeOf(context).height * .05,
                          width: MediaQuery.sizeOf(context).width * .1,
                          decoration: BoxDecoration(
                              color: ColorsUsed.primaryColor,
                              border:
                                  Border.all(color: ColorsUsed.primaryColor),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }

  Future bottom_sheet_OTP(
      {required context, required email, required via}) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " We send an OTP to your $via. please check and confirm",
                style: TextStyle(
                    color: ColorsUsed.primaryColor,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${email}",
                style: TextStyle(
                    color: ColorsUsed.primaryColor,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: otp_controller,
                decoration: InputDecoration(
                    hintText: "OTP",
                    label: Text("OTP"),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsUsed.primaryColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (otp_controller.text.isNotEmpty) {
                  } else {
                    bottom_sheet(data: "Enter OTP", context: context);
                  }
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * .4,
                  height: MediaQuery.sizeOf(context).height * .08,
                  decoration: BoxDecoration(
                      color: ColorsUsed.primaryColor,
                      border: Border.all(color: ColorsUsed.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: ColorsUsed.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  //
  // Encode message if necessary
  // var encodedMessage = Uri.encodeFull("Hello, this is a test message");
  // var whatsappUrl = "whatsapp://send?phone=$mobile_number&text=$encodedMessage";

  // Attempt to launch WhatsApp
  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     throw 'Could not launch WhatsApp';
  //   }
  // } catch (e) {
  //   print('Error launching WhatsApp: $e');
  //   // Handle error
  // }
}
// }
