import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/register_provider.dart';
import 'package:flutter_application_1/Views/loginPage/loginPage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

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

  Widget build(BuildContext context) {
    TextEditingController email_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();
    TextEditingController password_confirmation_controller =
        TextEditingController();
    TextEditingController name_controller = TextEditingController();
    TextEditingController user_name_controller = TextEditingController();
    TextEditingController gender_controller = TextEditingController();
    TextEditingController dob_controller = TextEditingController();
    var register_provider =
        Provider.of<Register_provider>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "email",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: password_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "password",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: password_confirmation_controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsUsed.primaryTextColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "retype password",
                  hintStyle: TextStyle(color: ColorsUsed.primaryTextColor)),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "send OTP",
                    style: TextStyle(
                        decorationColor: Colors.white,
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 1.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryTextColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "OTP",
                        hintStyle:
                            TextStyle(color: ColorsUsed.primaryTextColor)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // -------------------------------------------------------------------------------function for ontap
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .08,
                    width: MediaQuery.sizeOf(context).width -
                        MediaQuery.sizeOf(context).width / 1.3,
                    decoration: BoxDecoration(
                        color: ColorsUsed.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorsUsed.secondaryColor)),
                    child: Center(
                        child: Text(
                      "Verify",
                      style: TextStyle(
                          color: ColorsUsed.primaryColor,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              )
              // ElevatedButton(onPressed: () {}, child: Text("Verify"))
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * .08,
                  width: MediaQuery.sizeOf(context).width -
                      MediaQuery.sizeOf(context).width / 1.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsUsed.secondaryColor,
                      border: Border.all(color: ColorsUsed.secondaryColor)),
                  child: Center(
                    child: Text(
                      "XyZ3J7",
                      style: TextStyle(
                          color: ColorsUsed.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryTextColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Type Captcha",
                        hintStyle:
                            TextStyle(color: ColorsUsed.primaryTextColor)),
                  ),
                ),
              ),
            ],
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
                        email: email_controller.text,
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
                            color: ColorsUsed.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: ColorsUsed.secondaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.sizeOf(context).height * .09,
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
