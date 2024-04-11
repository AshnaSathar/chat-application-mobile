import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/register_provider.dart';
import 'package:flutter_application_1/Views/loginPage/loginPage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final String email;
  const RegisterPage({super.key, required this.email});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    try {} catch (error) {
      print("Error happens. Please try again later");
    }
  }

  TextEditingController password_controller = TextEditingController();
  late bool isPasswordVisible = false;
  late bool isPasswordVisible_1 = false;
  TextEditingController password_confirmation_controller =
      TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController user_name_controller = TextEditingController();
  TextEditingController gender_controller = TextEditingController();
  TextEditingController dob_controller = TextEditingController();
  Widget build(BuildContext context) {
    var register_provider =
        Provider.of<Register_provider>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Register your account",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: ColorsUsed.secondaryColor,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Full Name",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: user_name_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "User Name",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: gender_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Gender",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: dob_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Date of birth",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyleConstants.textstyle(
                  color: ColorsUsed.primaryTextColor),
              controller: password_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor),
                  suffix: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorsUsed.primaryIconColor,
                      ))),
              obscureText: !isPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyleConstants.textstyle(
                  color: ColorsUsed.primaryTextColor),
              controller: password_confirmation_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  hintText: "Re-Type",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor),
                  suffix: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible_1 = !isPasswordVisible_1;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorsUsed.primaryIconColor,
                      ))),
              obscureText: !isPasswordVisible_1,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    bool success = await register_provider.post_db(
                        name: name_controller.text,
                        email: widget.email,
                        password: password_controller.text,
                        password_confirmation:
                            password_confirmation_controller.text,
                        user_name: user_name_controller.text,
                        gender: gender_controller.text,
                        dob: dob_controller.text);
                    if (success) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    } else {
                      print("try again");
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: ColorsUsed.secondaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorsUsed.secondaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.sizeOf(context).height * .06,
                    width: MediaQuery.sizeOf(context).width * .5,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
