import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/preferences/preferences_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PreferencesScreen(index);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              child: SvgPicture.asset(
                  'assets/icons/${coffeeNames[index]}.svg'), //list mà mình đã khởi tạo
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text(
                coffeeNames[index],
                style: GoogleFonts.cabin(
                  fontWeight: FontWeight.w500,
                  color: mPrimaryTextColor,
                  fontSize: 22,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: mPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
