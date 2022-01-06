import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/home/home_screen.dart';
import 'package:coffee_shop/ui/screens/login/forgot_password.dart';
import 'package:coffee_shop/ui/screens/login/register_screen.dart';
import 'package:coffee_shop/ui/screens/menu/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //kiem tra du lieu da luu
  final _formKey = GlobalKey<FormState>();
  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  // chuỗi để hiển thị thông báo lỗi
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false, //Điều này đặt focus vào TextField k theo mặc định.
      controller: emailController,
      style: TextStyle(color: mPrimaryTextColor),
      keyboardType: TextInputType.emailAddress,
      // kiem tra dieu kien
      validator: (value) {
        //nếu để trống.
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //kiem tra phuong thuc nhap
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      //gia tri cua value
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

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      style: TextStyle(color: mPrimaryTextColor),
      controller: passwordController,
      obscureText: true, // ẩn pass
      validator: (value) {
        TextStyle(color: mPrimaryColor);
        RegExp regex = new RegExp(r'^.{6,}$'); // kiem tra du 6 ky tu
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key_sharp,
          color: mPrimaryColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle: TextStyle(color: Color(0xffCCCCCC)),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      color: mPrimaryColor,
      borderRadius: BorderRadius.circular(30).copyWith(),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: mBackgroundColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    return Scaffold(
      // backgroundColor: Color(0xFFB98068),
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
              // fontFamily: 'nomal',
              color: mPrimaryTextColor,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: mPrimaryTextColor,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: mPrimaryColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // canh theo chieu ngang,
                      children: [
                        TextButton(
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                color: mPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()),
                          ),
                        ),
                      ],
                    ),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: mPrimaryColor, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Registration",
                            style: TextStyle(
                              color: mSecondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      //de kiem tra _auth, email, pass da duoc tao tren firebase hay chua
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainScreen())),
                });
        // sau do neu uid khop voi email va pass da tao tren firebase thi nguoi dung co the dang nhap,
        // khi thanh cong no se xuat hien thong bao String, rôi chuyển đến màn hình MainScreen
      } on FirebaseAuthException catch (error) {
        //api error
        switch (error.code) {
          case "invalid-email":
            //Giá trị được cung cấp cho thuộc tính emailngười dùng không hợp lệ. Nó phải là một địa chỉ email chuỗi.
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            //Không có bản ghi mật khẩu hợp lệ trong firebase
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            //Không có bản ghi người dùng hiện có tương ứng với số nhận dạng được cung cấp.
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            //User đã bị vô hiệu hoá
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            //Nhà cung cấp dịch vụ đăng nhập được cung cấp đã bị vô hiệu hóa đối với dự án Firebase của bạn. Bật nó từ phần Phương pháp đăng nhập của bảng điều khiển Firebase.
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!); // hien thi errorMessage
        print(error.code);
      }
    }
  }
}
