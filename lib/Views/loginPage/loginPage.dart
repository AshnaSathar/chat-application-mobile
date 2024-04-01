import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/forget_password_provider.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/Views/HomePage/homePage.dart';
import 'package:flutter_application_1/Views/a.dart';
import 'package:flutter_application_1/Views/loginPage/update_password.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  static Route HomeRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 1),
    );
  }
}

// bool is_send_otp = false;
class _LoginPageState extends State<LoginPage> {
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController name_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  List<CheckboxItem> checkboxes = [
    CheckboxItem(
      name: 'Remember my ID and password',
    ),
    CheckboxItem(name: 'Sign in automatically'),
    CheckboxItem(name: 'Sign in as invisible to everyone'),
  ];
  late bool isPasswordVisible = false;
  late bool showOtpField = false;
  bool showField = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController email_id_controller = TextEditingController();
    // TextEditingController user_name_controller = TextEditingController();
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    "ynotz",
                    style: TextStyleConstants.textstyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: ColorsUsed.secondaryColor),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name_controller,
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
                    hintText: "User Name",
                  ),
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
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryTextColor),
                        ),
                        hintText: "Password",
                        hintStyle:
                            TextStyle(color: ColorsUsed.primaryTextColor),
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
                  )),
              Container(
                  width: double.infinity,
                  child: CheckboxGroup(
                    items: checkboxes,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () async {
                        print("name");
                        print(name_controller.text);
                        print("password");
                        print(password_controller.text);
                        if (name_controller.text.isNotEmpty) {
                          if (password_controller.text.isNotEmpty) {
                            bool success = await Provider.of<Login_provider>(
                                    context,
                                    listen: false)
                                .post_db(
                              user_name: name_controller.text,
                              password: password_controller.text,
                            );
                            if (success) {
                              Navigator.of(context).push(LoginPage.HomeRoute());
                            } else {
                              show_bottom_sheet(
                                  context: context,
                                  data_to_display:
                                      "Incorrect username or password!!!");
                            }
                          } else {
                            show_bottom_sheet(
                                context: context,
                                data_to_display:
                                    "Please enter your password!!");
                          }
                        } else {
                          if (name_controller.text.isEmpty &&
                              password_controller.text.isNotEmpty) {
                            show_bottom_sheet(
                                context: context,
                                data_to_display:
                                    "Please enter your username!!!");
                          } else
                            show_bottom_sheet(
                                context: context,
                                data_to_display:
                                    "Please enter your password and username");
                        }
                      },
                      child: Container(
                        width: width * .3,
                        height: height * .06,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(237, 244, 244, 244),
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyleConstants.textstyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorsUsed.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(228, 255, 253, 253),
                            title: Text(
                              "Search Your Account By",
                              style: TextStyle(
                                  color: ColorsUsed.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                            actions: [
                              TextFormField(
                                controller: email_id_controller,
                                decoration: InputDecoration(
                                  labelText: "email Id",
                                  labelStyle:
                                      TextStyle(color: ColorsUsed.primaryColor),
                                  hintText: "email Id",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsUsed.primaryColor)),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () async {
                                      final bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(email_id_controller.text);
                                      if (email_id_controller.text == null ||
                                          email_id_controller.text == "") {
                                        show_bottom_sheet(
                                            context: context,
                                            data_to_display:
                                                "Email id can't be null. please enter your email_id");
                                      } else {
                                        if (emailValid) {
                                          bool status = await Provider.of<
                                                      Forget_password_provider>(
                                                  context,
                                                  listen: false)
                                              .get_data(
                                                  email_id:
                                                      email_id_controller.text);
                                          if (status) {
                                            navigate_toupdate_password(
                                                context: context,
                                                data: email_id_controller.text,
                                                is_email_id: true);
                                          } else {
                                            show_bottom_sheet(
                                                context: context,
                                                data_to_display:
                                                    "Invalid email!! Try adding registered email");
                                          }

                                          email_id_controller.clear();
                                        } else {
                                          show_bottom_sheet(
                                              context: context,
                                              data_to_display:
                                                  "invalid email format");
                                        }
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: ColorsUsed.primaryColor,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: ColorsUsed.secondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Forget your password?",
                      style: TextStyleConstants.textstyle(
                          fontWeight: FontWeight.w400,
                          color: ColorsUsed.primaryTextColor),
                    ),
                  )),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Welcome_page(),
                      ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => RegisterPage(),
                  //     ));
                },
                child: Text(
                  "Don't have an account?",
                  style: TextStyleConstants.textstyle(
                      fontWeight: FontWeight.w400,
                      color: ColorsUsed.primaryTextColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future show_bottom_sheet({required context, required data_to_display}) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: double.infinity,
          color: Colors.transparent,
          child: Center(
            child: Text(
              data_to_display,
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

  Future navigate_toupdate_password(
      {required context, required is_email_id, required data}) async {
    var email_id;
    var user_name;

    if (is_email_id != null) {
      email_id = data;
      user_name = null;
    } else {
      user_name = data;
      email_id = null;
    }
    if (email_id == null && user_name == null) {
      print("1");
      show_bottom_sheet(
          context: context, data_to_display: "Both fields can't be empty");
    } else if (email_id != null && user_name == null) {
      print("2");
      print("$email_id && $user_name");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Update_password(
              email_id: email_id,
              user_name:
                  Provider.of<Forget_password_provider>(context, listen: false)
                      .user_name,
            ),
          ));
    } else if (email_id == null && user_name != null) {
      if (user_name == "") {
        print("empty");
      }
      print("3");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Update_password(
              email_id: null,
              user_name: user_name,
            ),
          ));
    }
  }
}
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: InkWell(
//     onTap: () {
//       Navigator.pop(context);
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Enter your User_name",
//               style: TextStyle(
//                   color: ColorsUsed.primaryColor,
//                   fontFamily:
//                       GoogleFonts.montserrat()
//                           .fontFamily),
//             ),
//             actions: [
//               Padding(
//                 padding:
//                     const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller:
//                       user_name_controller,
//                   decoration: InputDecoration(
//                     labelText: "User_name",
//                     labelStyle: TextStyle(
//                         color: ColorsUsed
//                             .primaryColor),
//                     hintText: "User_name",
//                     enabledBorder:
//                         OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: ColorsUsed
//                                     .primaryColor)),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     navigate_toupdate_password(
//                         data: user_name_controller
//                             .text,
//                         is_email_id: false,
//                         context: context);
//                   },
//                   child: CircleAvatar(
//                     backgroundColor:
//                         ColorsUsed.primaryColor,
//                     child: Icon(
//                       Icons
//                           .arrow_forward_ios_outlined,
//                       color: ColorsUsed
//                           .secondaryColor,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       );
//       // -----------------
//     },
//     child: Container(
//       height:
//           MediaQuery.sizeOf(context).height * .07,
//       width:
//           MediaQuery.sizeOf(context).width * .3,
//       decoration: BoxDecoration(
//         border: Border.all(
//             color: ColorsUsed.primaryColor),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Center(
//           child: Text(
//         "User_name",
//         style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontFamily: GoogleFonts.montserrat()
//                 .fontFamily,
//             color: ColorsUsed.primaryColor),
//       )),
//     ),
//   ),
// )

//  Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: InkWell(
//     onTap: () {
//       Navigator.pop(context);
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Enter your email id",
//               style: TextStyle(
//                   color: ColorsUsed.primaryColor,
//                   fontFamily:
//                       GoogleFonts.montserrat()
//                           .fontFamily),
//             ),
//             actions: [
//               Padding(
//                 padding:
//                     const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: email_id_controller,
//                   decoration: InputDecoration(
//                     labelText: "email Id",
//                     labelStyle: TextStyle(
//                         color: ColorsUsed
//                             .primaryColor),
//                     hintText: "email Id",
//                     enabledBorder:
//                         OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: ColorsUsed
//                                     .primaryColor)),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     navigate_toupdate_password(
//                         data: email_id_controller
//                             .text,
//                         is_email_id: true,
//                         context: context);
//                   },
//                   child: CircleAvatar(
//                     backgroundColor:
//                         ColorsUsed.primaryColor,
//                     child: Icon(
//                       Icons
//                           .arrow_forward_ios_outlined,
//                       color: ColorsUsed
//                           .secondaryColor,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       );
//       // -------------------
//     },
//     child: Container(
//       height:
//           MediaQuery.sizeOf(context).height * .07,
//       width:
//           MediaQuery.sizeOf(context).width * .3,
//       decoration: BoxDecoration(
//         border: Border.all(
//             color: ColorsUsed.primaryColor),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Center(
//           child: Text(
//         "Email_id",
//         style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontFamily: GoogleFonts.montserrat()
//                 .fontFamily,
//             color: ColorsUsed.primaryColor),
//       )),
//     ),
//   ),
// ),
