import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/models/user_model.dart';
import 'package:coffee_shop/ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';

class Provider extends StatefulWidget {
  const Provider({Key? key}) : super(key: key);

  @override
  _ProviderState createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
  User? user = FirebaseAuth.instance.currentUser;
  usercoffee loggedInUser = usercoffee();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = usercoffee.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(
          'Provider',
          style: TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.w700,
            color: mPrimaryColor,
            // letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: mBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: mPrimaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // SizedBox(
              //   height: 100,
              // ),
              UserStyle(size: size),
              SizedBox(
                height: 100,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: mPrimaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Name: " "${loggedInUser.name}",
                  style: TextStyle(
                    fontSize: 20,
                    color: mPrimaryTextColor,
                    fontWeight: FontWeight.w500,
                  )),
              Text(
                "Email: " "${loggedInUser.email}",
                style: TextStyle(
                  fontSize: 20,
                  color: mPrimaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
