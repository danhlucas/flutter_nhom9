import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/screens.dart';
import 'package:coffee_shop/ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  // late String _email;
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      style: TextStyle(color: mPrimaryTextColor),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        //kiem tra cac dieu kien
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.mail,
          color: mPrimaryColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle: TextStyle(color: Color(0xffCCCCCC)),
      ),
    );

    final SendButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30).copyWith(),
      color: mPrimaryColor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Send(
            emailController.text,
          );
        },
        child: Text(
          "Send",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      // backgroundColor: mBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: mPrimaryColor,
          ),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: mPrimaryColor),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: size.width * 0.8,
            child: Text(
              'Please enter your Email,\nwe will send instructions on how to recover lost password!',
              style: TextStyle(color: mPrimaryColor, fontSize: 20),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 0,
                        ),
                        SizedBox(height: 30),
                        emailField,
                        SizedBox(height: 25),
                        SendButton,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void Send(String email) async {
    if (_formKey.currentState!.validate()) {
      //de kiem tra _auth, email da duoc tao tren firebase hay chua
      try {
        await _auth
            .sendPasswordResetEmail(email: email)
            // .signInWithEmailAndPassword(email: email)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Please check your email"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                });
        // sau do neu uid khop voi email  da tao tren firebase thi nguoi dung co the tiep tuc,
        // khi thanh cong no se xuat hien thong bao String, rôi chuyển đến màn hình LoginScreen
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          default: // nếu xả ra lỗi sẽ trả về default
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
