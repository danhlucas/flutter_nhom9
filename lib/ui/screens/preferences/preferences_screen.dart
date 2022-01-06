// ignore_for_file: deprecated_member_use

import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/end/end.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget_preferences/attribute.dart';
import 'widget_preferences/name_and_number.dart';

class PreferencesScreen extends StatelessWidget {
  final int index;
  PreferencesScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Order',
          style: TextStyle(
            color: mPrimaryColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: mPrimaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/header.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: UnconstrainedBox(
              child: SvgPicture.asset(
                'assets/icons/${coffeeNames[index]}.svg',
                height: 100,
              ),
            ),
          ),
          NameAndNumber(index: index),
          Divider(
            color: mPrimaryColor.withOpacity(0.5),
          ),
          Attribute(
            title: 'Size',
            iconNames: ['size1', 'size2', 'size3'],
            alignment: Alignment.bottomLeft,
            check: 1,
          ),
          Divider(
            color: mPrimaryColor.withOpacity(0.5),
          ),
          Attribute(
            title: 'Sugar ',
            iconNames: ['sugar1', 'sugar2', 'sugar3', 'sugar4'],
            alignment: Alignment.bottomLeft,
            check: 2,
          ),
          Divider(
            color: mPrimaryColor.withOpacity(0.5),
          ),
          Attribute(
            title: 'Additions',
            iconNames: ['additions1', 'additions2'],
            alignment: Alignment.bottomLeft,
            check: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    color: mPrimaryColor,
                    fontSize: 28,
                  ),
                ),
                Text(
                  '40 K',
                  style: TextStyle(
                    color: mTitleTextColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
              color: mPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EndScreen();
                }));
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                alignment: Alignment.center,
                child: Text(
                  'Payment',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    // fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
