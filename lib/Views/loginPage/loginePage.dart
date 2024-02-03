import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/chatPage/homePage.dart';
import 'package:flutter_application_1/Views/loginPage/colorConstant.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CheckboxItem> checkboxes = [
      CheckboxItem(name: 'Remember my ID and password'),
      CheckboxItem(name: 'Sign in automatically'),
      CheckboxItem(name: 'Sign in as invisible to everyone'),
    ];

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
                padding: const EdgeInsets.only(left: 35, right: 15),
                child: Row(
                  children: [
                    Text(
                      "ynotz id: ",
                      style: TextStyle(
                          color: ColorsUsed.textColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.vertical())),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 40, top: 8, left: 20, right: 15),
                child: Row(
                  children: [
                    Text(
                      "Password: ",
                      style: TextStyle(
                          color: ColorsUsed.textColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                    )
                  ],
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
                      Navigator.of(context).push(HomeRoute());
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
                      )),
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

  static Route HomeRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        const duration = Duration(seconds: 2);

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
