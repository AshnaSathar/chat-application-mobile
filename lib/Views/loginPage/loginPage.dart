import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/HomePage/homePage.dart';
import 'package:flutter_application_1/Views/loginPage/colorConstant.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';

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

class _LoginPageState extends State<LoginPage> {
  bool isvisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<CheckboxItem> checkboxes = [
    CheckboxItem(name: 'Remember my ID and password'),
    CheckboxItem(name: 'Sign in automatically'),
    CheckboxItem(name: 'Sign in as invisible to everyone'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.bgcolor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  "ynotz",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: ColorsUsed.textColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Ynotz Id",
                      ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: isvisible ? true : false,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: isvisible
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                isvisible = false;
                              });
                            },
                            child: Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            ))
                        : InkWell(
                            onTap: () {
                              setState(() {
                                isvisible = true;
                              });
                            },
                            child: Icon(
                              Icons.visibility,
                              color: Colors.white,
                            )),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Password",
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: CheckboxGroup(
                  items: checkboxes,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(LoginPage.HomeRoute());
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .3,
                      height: MediaQuery.sizeOf(context).height * .06,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(237, 244, 244, 244),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsUsed.bgcolor,
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
                  onTap: () {},
                  child: Text(
                    "Forget your password?",
                    style: TextStyle(
                        color: ColorsUsed.textColor,
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
