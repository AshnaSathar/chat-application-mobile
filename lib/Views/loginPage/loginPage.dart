import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/HomePage/homePage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
// route function with transition effect
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

class _LoginPageState extends State<LoginPage> {
  bool isvisible = false;

  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<CheckboxItem> checkboxes = [
    CheckboxItem(name: 'Remember my ID and password'),
    CheckboxItem(name: 'Sign in automatically'),
    CheckboxItem(name: 'Sign in as invisible to everyone'),
  ];
  late bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
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
                  child: Text("ynotz",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: ColorsUsed.secondaryColor,
                          fontSize: 50,
                          fontWeight: FontWeight.w900))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: nameController,
                      style: TextStyle(color: ColorsUsed.primaryTextColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsUsed.primaryTextColor),
                        ),
                        hintStyle:
                            TextStyle(color: ColorsUsed.primaryTextColor),
                        hintText: "Ynotz Id",
                      ))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: ColorsUsed.primaryTextColor),
                  controller: passwordController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsUsed.primaryTextColor),
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
                      ),
                    ),
                  ),
                  obscureText: !isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
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
                    onTap: () {
                      if (nameController.text.isNotEmpty &&
                          nameController.text.contains(emailValid) &&
                          passwordController.text.isNotEmpty) {
                        Navigator.of(context).push(LoginPage.HomeRoute());
                      } else {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                  color: Colors.transparent,
                                  width: width,
                                  height: height * .5 / 4,
                                  child: Center(
                                      child: Text(
                                    "Please Enter Your Email Id and Password!!",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )));
                            });
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
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsUsed.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
// -------------------------------------------------------------------------------------functionalities
                  },
                  child: Text(
                    "Forget your password?",
                    style: TextStyle(
                        color: ColorsUsed.secondaryColor,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//  Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.visiblePassword,
//                   textInputAction: TextInputAction.done,
//                   onTap: () {
//                     iconpresent = false;
//                   },
//                   obscureText: isvisible ? true : false,
//                   controller: passwordController,
//                   style: TextStyle(color: ColorsUsed.primaryTextColor),
//                   decoration: InputDecoration(
//                     suffixIcon: isvisible
//                         ? InkWell(
//                             onTap: () {
//                               setState(() {
//                                 isvisible = false;
//                               });
//                             },
//                             child: Icon(
//                               Icons.visibility_off,
//                               color: ColorsUsed.primaryIconColor,
//                             ))
//                         : InkWell(
//                             onTap: () {
//                               setState(() {
//                                 isvisible = true;
//                               });
//                             },
//                             child: Icon(
//                               Icons.visibility,
//                               color: ColorsUsed.primaryIconColor,
//                             )),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: ColorsUsed.primaryTextColor),
//                     ),
//                     hintStyle: TextStyle(color: ColorsUsed.primaryTextColor),
//                     hintText: "Password",
//                   ),
//                 ),
//               ),