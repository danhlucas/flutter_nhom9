import 'package:coffee_shop/ui/screens/login/register_screen.dart';
import 'package:coffee_shop/ui/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'ui/screens/login/forgot_password.dart';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CoffeeShop',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: mBackgroundColor,
        splashColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        'Quên mật khẩu': (context) => ForgotPassword(),
        'Đăng ký': (context) => RegistrationScreen(),
      },
    );
  }
}
