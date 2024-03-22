import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Controller/register_provider.dart';
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
        ],
        child: SafeArea(
            child: MaterialApp(
                debugShowCheckedModeBanner: false, home: LoginPage())));
  }
}
