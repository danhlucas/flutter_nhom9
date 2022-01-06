import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage('assets/images/page.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'A good cup of coffee is both sweet and bitter.\nAn ideal love is a love that is both sweet and bitter!',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.oswald(fontSize: 20, color: Colors.black87),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Welcome to the Coffee Shop!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontStyle: FontStyle.italic,
                    fontSize: 29,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
