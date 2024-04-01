import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/forget_password_provider.dart';
import 'package:flutter_application_1/Views/HomePage/homePage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Password_change extends StatefulWidget {
  final otp;
  final email_id;

  const Password_change({Key? key, required this.otp, required this.email_id})
      : super(key: key);

  @override
  State<Password_change> createState() => _Password_changeState();
}

class _Password_changeState extends State<Password_change> {
  late bool isPasswordVisible = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController newConfirmationPasswordController =
      TextEditingController();
  late bool isReTypePasswordVisible = false;
  bool isValid = false;
  String passwordStrength = ''; // Variable to store password strength

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(240, 255, 253, 253),
                        title: Center(
                          child: Text(
                            "Instructions",
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontWeight: FontWeight.w800,
                              color: ColorsUsed.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "1. Password must be 8 characters long.\n\n 2. It should be a combination of alphabets,numbers and special characters\n\n 3. First character of the password should be an alphabet.\n\n 4. It is good if you include atleast one capital letter.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: ColorsUsed.primaryColor,
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * .05,
                                width: MediaQuery.sizeOf(context).width * .1,
                                decoration: BoxDecoration(
                                    color: ColorsUsed.primaryColor,
                                    border: Border.all(
                                        color: ColorsUsed.primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  "Ok",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                  ),
                                )),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
            child: Text(
              textAlign: TextAlign.justify,
              "Create a strong password with atleast 6 letters and numbers.You need this password at the time of login. Don't share your password. ",
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
              onChanged: (password) async {
                _validatePassword(password: passwordController.text);
                String strength = await checkStrength(password: password);
                setState(() {
                  passwordStrength = strength; // Update password strength
                });
              },
              obscureText: !isPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: passwordController,
              style: TextStyleConstants.textstyle(
                  color: ColorsUsed.primaryTextColor),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: passwordController.text.isEmpty ||
                            passwordController.text == ""
                        ? Colors.white
                        : isValid
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: passwordController.text.isEmpty ||
                            passwordController.text == ""
                        ? Colors.white
                        : isValid
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: ColorsUsed.primaryTextColor,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: ColorsUsed.primaryIconColor,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  passwordStrength,
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    color: passwordStrength == "strong"
                        ? Colors.green
                        : passwordStrength == "weak"
                            ? Colors.red
                            : Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
            child: TextFormField(
              controller: newConfirmationPasswordController,
              style: TextStyleConstants.textstyle(
                  color: ColorsUsed.primaryTextColor),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: "Re-type password",
                hintStyle: TextStyle(
                  color: ColorsUsed.primaryTextColor,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      isReTypePasswordVisible = !isReTypePasswordVisible;
                    });
                  },
                  child: Icon(
                    isReTypePasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: ColorsUsed.primaryIconColor,
                  ),
                ),
              ),
              obscureText: !isReTypePasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 15),
            child: InkWell(
              onTap: () async {
                if (passwordController.text.isNotEmpty) {
                  if (newConfirmationPasswordController.text.isNotEmpty) {
                    if (passwordController.text ==
                        newConfirmationPasswordController.text) {
                      bool status = await Provider.of<Forget_password_provider>(
                              context,
                              listen: false)
                          .post_reset_password(
                              email_id: widget.email_id,
                              otp: widget.otp,
                              new_password: passwordController.text,
                              password_confirmation:
                                  newConfirmationPasswordController.text);

                      if (status) {
                        showBottomSheet(
                            context: context,
                            dataToDisplay: "Password changed successfully");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      } else {
                        showBottomSheet(context: context, dataToDisplay: "");
                      }
                    } else {
                      showBottomSheet(
                          context: context,
                          dataToDisplay: "Both fields should be the same");
                    }
                  } else {
                    showBottomSheet(
                        context: context,
                        dataToDisplay: "Confirmation of password needed");
                  }
                } else {
                  if (newConfirmationPasswordController.text.isEmpty) {
                    showBottomSheet(
                        context: context,
                        dataToDisplay: "Please enter both fields");
                  } else {
                    showBottomSheet(
                        context: context,
                        dataToDisplay: "Please enter password field");
                  }
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * .3,
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

  Future showBottomSheet({required context, required dataToDisplay}) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: double.infinity,
          color: Colors.transparent,
          child: Center(
            child: Text(
              dataToDisplay,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontWeight: FontWeight.bold,
                color: ColorsUsed.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Future checkStrength({required String password}) async {
    bool hasUppercase = false;
    bool hasLowercase = false;
    bool hasDigit = false;
    bool hasSpecialChar = false;
    var strong = "strong";
    var weak = "weak";
    var medium = "Medium";
    if (password.length < 6) {
      print("Weak: Password is too short");
      return weak;
    }
    for (int i = 0; i < password.length; i++) {
      if (password[i].toUpperCase() != password[i]) {
        hasLowercase = true;
      }
      if (password[i].toLowerCase() != password[i]) {
        hasUppercase = true;
      }
      if (password[i].contains(RegExp(r'\d'))) {
        hasDigit = true;
      }
      if (password[i].contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialChar = true;
      }
    }
    if (hasLowercase && hasUppercase && hasDigit && hasSpecialChar) {
      print("Strong: Password meets all criteria");
      return strong;
    } else {
      print("Weak: Password does not meet all criteria");
      return medium;
    }
  }

  void _validatePassword({required password}) {
    setState(() {
      RegExp regex = RegExp(
          r"^(?=.*\d)(?=.*[a-zA-Z])(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]{6,}$");
      isValid = regex.hasMatch(password);
    });
  }
}
