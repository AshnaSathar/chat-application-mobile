import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/friendship_provider.dart';
import 'package:flutter_application_1/Controller/all_users_provider.dart';
import 'package:flutter_application_1/Controller/forget_password_provider.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/Controller/otp.dart';
import 'package:flutter_application_1/Controller/profile_updation_provider.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Controller/register_provider.dart';
import 'package:flutter_application_1/Views/a.dart';
import 'package:flutter_application_1/Views/loginPage/loginPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProviderClass(),
          ),
          ChangeNotifierProvider(
            create: (context) => Login_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Register_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Forget_password_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Profile_updation_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => All_users_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Friendship_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Otp_provider(),
          ),
        ],
        child: SafeArea(
            child: MaterialApp(
                debugShowCheckedModeBanner: false, home: LoginPage())));
  }
}
