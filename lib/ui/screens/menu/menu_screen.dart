// import 'dart:js';
import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/login/login_screen.dart';
import 'package:coffee_shop/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget_menu/menu_item.dart';
import 'widget_menu/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: mPrimaryColor),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Menu',
          style: TextStyle(
            color: mPrimaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      endDrawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Team 9',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: mSecondTextColor,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Personal Information',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: mPrimaryColor,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: mSecondColor,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: mPrimaryColor,
                  // letterSpacing: 2.0,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),
            Divider(height: 3.0),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: mSecondColor,
              ),
              title: Text(
                'Provider',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: mPrimaryColor,
                  // letterSpacing: 2.0,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Provider()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: mSecondColor,
              ),
              title: Text(
                'Log Out',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: mPrimaryColor,
                  // letterSpacing: 2.0,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.close,
                color: mSecondColor,
              ),
              title: Text(
                'Exit',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: mPrimaryColor,
                  // letterSpacing: 2.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: coffeeNames.length,
            itemBuilder: (context, index) => MenuItem(
              index: index,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Text(
                  'Good to the last drop',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: mPrimaryColor,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
