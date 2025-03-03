// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peninsula_app/utils.dart';
// import 'package:http/http.dart' as http;
import 'dart:math' as math;

import 'package:provider/provider.dart';

import 'providers/loginProviders.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  final formkey = GlobalKey<FormState>();

  // late LoginProvider loginProvider;
  // bool _isListenerAttached = false;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (!_isListenerAttached) {
  //     loginProvider = Provider.of<LoginProvider>(context, listen: false);
  //     loginProvider.addListener(_loginStatusListener);
  //     _isListenerAttached = true;
  //   }
  // }

  // void _loginStatusListener() {
  //   if (loginProvider.success) {
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //               "Login Successful! Your name is ${loginProvider.name} and your mail is ${loginProvider.email}"),
  //           backgroundColor: Color.fromARGB(255, 20, 218, 43),
  //         ),
  //       );
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   loginProvider.removeListener(_loginStatusListener);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // print("object");
    // debugPrint(MediaQuery.of(context).size.width.toString());
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final effectiveWidth = deviceWidth > 600 ? 600.0 : deviceWidth;
    final effectiveHeight = deviceHeight > 852 ? 852.0 : deviceHeight;

    final loginProvider = Provider.of<LoginProvider>(context);

    // void showSnackBarInLogin(String email, String name) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content:
    //         Text("Login Successful Your email is $email & your name is  $name"),
    //     backgroundColor: Colors.green,
    //   ));
    // }

    double widthRatio = effectiveWidth / 393.0;
    double heightRatio = effectiveHeight / 852.0;
    // double widthRatio = MediaQuery.of(context).size.width / 393.0;
    // double heightRatio = MediaQuery.of(context).size.height / 852.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        child: Consumer<LoginProvider>(
          builder: (context, loginprovider, child) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: registrationAndLoginBackground(),
              child: Stack(
                children: [
                  Positioned(
                      top: heightRatio * 198,
                      left: widthRatio * 110.87,
                      child: Container(
                        alignment: Alignment(100.0, 100.0),
                        width: widthRatio * 170.25,
                        height: heightRatio * 38.19,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/peninsulaLogoWithName.png"),
                                fit: BoxFit.fill)),
                      )),
                  Positioned(
                    top: heightRatio * 293.19,
                    left: widthRatio * 33.0,
                    child: Container(
                      alignment: Alignment(100.0, 100.0),
                      width: widthRatio * 326.0,
                      height: heightRatio * 361.0,
                      // padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color.fromRGBO(8, 55, 60, 0.65)
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Color.fromRGBO(17, 153, 142, 0.6).withOpacity(0.60),
                          //     Color.fromRGBO(0, 0, 0, 0.6).withOpacity(0.60),
                          //   ],
                          // ),
                          ),
                    ),
                  ),
                  Form(
                      key: formkey,
                      child: Stack(
                        children: [
                          regField(
                            heightRatio: heightRatio,
                            widthRatio: widthRatio,
                            top: 320.19,
                            left: 58,
                            width: 276,
                            textField: labelNameUtil(
                                labelName: "Username/ Email ID",
                                opacity: 0.5,
                                textController:
                                    loginProvider.username_textcontroller),
                          ),
                          regField(
                            heightRatio: heightRatio,
                            widthRatio: widthRatio,
                            top: 384.19,
                            left: 58,
                            width: 276,
                            textField: labelNameUtil(
                                labelName: "Password",
                                opacity: 0.5,
                                textController:
                                    loginProvider.password_textcontroller),
                          ),
                        ],
                      )),
                  Positioned(
                    top: heightRatio * 447.19,
                    left: widthRatio * 61,
                    right: widthRatio * 61,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                              side: BorderSide(color: Colors.white),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.09,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white70,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loginProvider.loading
                      ? Positioned(
                          top: heightRatio * 484,
                          left: widthRatio * 180,
                          child: CircularProgressIndicator(
                            color: Color(0xFF11998E),
                          ),
                        )
                      : button(
                          heightRatio: heightRatio,
                          widthRatio: widthRatio,
                          top: 484,
                          width: 276,
                          left: 58,
                          radius: 35,
                          title: "Login",
                          formkey: formkey,
                          functionName: loginProvider.loginuser,
                          snackbar: () => loginprovider.success
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      loginprovider.message),
                                  backgroundColor: Colors.green,
                                ))
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(loginprovider.message),
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 63, 23),
                                )),
                        ),
                  Positioned(
                    top: heightRatio * 569.19,
                    left: widthRatio * 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Transform.rotate(
                            angle: -math.pi,
                            child: Container(
                              width: widthRatio * 98,
                              height: heightRatio * 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    hexToColor("#FFFFFF"),
                                    Color.fromRGBO(153, 153, 153, 0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: widthRatio * 68,
                            height: heightRatio * 11,
                            alignment: Alignment.center,
                            child: Text(
                              'Or Log In With',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 9.35,
                                height: 11.4 / 9.35,
                                letterSpacing: -0.09,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: widthRatio * 97,
                            height: heightRatio * 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  hexToColor("#FFFFFF"),
                                  Color.fromRGBO(153, 153, 153, 0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: heightRatio * 595.11,
                    left: widthRatio * 138,
                    child: SizedBox(
                      width: widthRatio * 117.1850814819336,
                      height: heightRatio * 29.72804832458496,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/images/googleLogo.png"),
                          ),
                          CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/images/appleLogo.png"),
                          ),
                          CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/images/facebookLogo.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
