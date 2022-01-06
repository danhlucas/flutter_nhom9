import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment Success',
          style: TextStyle(
            color: mPrimaryColor,
            fontWeight: FontWeight.bold,
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
      body: Column(
        children: <Widget>[
          Image.asset('assets/images/coffee_time.png'),
          SizedBox(
            height: 25,
          ),
          Text(
            'Pleasure to serve you!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mPrimaryTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'It will take a few minutes for the order to be successfully delivered!',
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontSize: 18,
              color: mPrimaryTextColor,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          LoginButton(
            buttonName: 'Buy More',
          )
        ],
      ),
    );
  }
}
