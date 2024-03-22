import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/forget_password_provider.dart';
import 'package:flutter_application_1/Views/HomePage/homePage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Password_change extends StatefulWidget {
  const Password_change({super.key});

  @override
  State<Password_change> createState() => _Password_changeState();
}

class _Password_changeState extends State<Password_change> {
  @override
  Widget build(BuildContext context) {
    TextEditingController password_controller = TextEditingController();
    TextEditingController new_confirmation_password_controller =
        TextEditingController();
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
            child: Text(
              "Create a new password",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: ColorsUsed.secondaryColor,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
            child: Text(
              textAlign: TextAlign.justify,
              "Create a strong password with atleast 6 letters and numbers.You need this password at the time of login. Don't share your password.",
              style: TextStyle(
                color: ColorsUsed.secondaryColor,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
              child: TextFormField(
                  controller: password_controller,
                  style: TextStyleConstants.textstyle(
                      color: ColorsUsed.primaryTextColor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsUsed.primaryTextColor),
                    ),
                    hintStyle: TextStyle(color: ColorsUsed.primaryTextColor),
                    hintText: "New password",
                  ))),
          Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
              child: TextFormField(
                  controller: new_confirmation_password_controller,
                  style: TextStyleConstants.textstyle(
                      color: ColorsUsed.primaryTextColor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsUsed.primaryTextColor),
                    ),
                    hintStyle: TextStyle(color: ColorsUsed.primaryTextColor),
                    hintText: "Re-type password",
                  ))),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
            child: InkWell(
              onTap: () async {
                if (password_controller.text.isNotEmpty) {
                  if (new_confirmation_password_controller.text.isNotEmpty) {
                    if (password_controller.text ==
                        new_confirmation_password_controller.text) {
                      bool success = await Provider.of<
                              Forget_password_provider>(context, listen: false)
                          .post_db_forget(
                              confirmation_password: password_controller.text,
                              new_password:
                                  new_confirmation_password_controller.text,
                              user_id: 25);
                      if (success) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }
                    }
                  } else {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.transparent,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * .5 / 4,
                          child: Center(
                            child: Text(
                              "Confirmation of password needed!!",
                              style: TextStyleConstants.textstyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsUsed.primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  if (new_confirmation_password_controller.text.isEmpty) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.transparent,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * .5 / 4,
                          child: Center(
                            child: Text(
                              "Please enter both password fields!!",
                              style: TextStyleConstants.textstyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsUsed.primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.transparent,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * .5 / 4,
                          child: Center(
                            child: Text(
                              "Please enter password field!!",
                              style: TextStyleConstants.textstyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsUsed.primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * .07,
                width: MediaQuery.sizeOf(context).width * .3,
                decoration: BoxDecoration(
                    color: ColorsUsed.secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorsUsed.secondaryColor)),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: ColorsUsed.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
