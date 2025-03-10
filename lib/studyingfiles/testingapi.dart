import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:incube_flutter_app/providers/loginProvider.dart';
// import 'package:incube_flutter_app/utils/color_functions.dart';
import 'package:http/http.dart' as http;
import 'package:peninsula_app/utils/utils.dart';
// import 'package:provider/provider.dart';

class Loginscreen2 extends StatefulWidget {
  const Loginscreen2({
    super.key,
  });

  @override
  State<Loginscreen2> createState() => _Loginscreen2State();
}

class _Loginscreen2State extends State<Loginscreen2> {
  final formkey = GlobalKey<FormState>();

  var username_textcontroller = TextEditingController();
  var pass_textcontroller = TextEditingController();

  Loginuser() async {
    var url = Uri.parse("https://dummyjson.com/auth/login");
    Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json"
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        "username":username_textcontroller.text,
        "password":pass_textcontroller.text
      }
      ),
    );
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Login Successful Your email is ${data['email']} & your name is  ${data['firstName']} ${data['lastName']}"),
      backgroundColor: Colors.green,
    ));

    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        // extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/loginbg.png"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      size: 25,
                      color: hexToColor("E1E1E1"),
                    ),
                    Text(
                      "Back",
                      style:
                          TextStyle(color: hexToColor("E1E1E1"), fontSize: 18),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: h * 0.21,
              ),
              Image.asset(
                "assets/images/peninsulaLogoWithName.png",
                scale: 1.7,
              ),
              Container(
                height: h * 0.5,
                width: w * 0.8,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: hexToColor("11998E").withOpacity(.2),

                  // gradient: LinearGradient(colors: [
                  //   hexToColor("000000").withOpacity(.5),
                  //   hexToColor("11998E").withOpacity(.6),
                  // ]),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: hexToColor("000000").withOpacity(.5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: username_textcontroller,
                            validator: (value) {
                              if (value != null) {
                                if (value.isNotEmpty) {
                                  return null;
                                } else {
                                  return "You must Enter a User name";
                                }
                              } else {
                                return "You Have not enter any value";
                              }
                            },
                            decoration: InputDecoration(
                                label: Text(
                                  "UserName",
                                  style: TextStyle(
                                      color: hexToColor("E1E1E1"),
                                      fontSize: 15),
                                ),
                                filled: true,
                                hintText: "Hey Type Your Username",
                                // enabledBorder: ,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                fillColor:
                                    hexToColor("11998E").withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: pass_textcontroller,
                            validator: (value) {
                              if (value != null) {
                                if (value.isNotEmpty) {
                                  return null;
                                } else {
                                  return "You must Enter a Password";
                                }
                              } else {
                                return "You Have not enter any value";
                              }
                            },
                            decoration: InputDecoration(
                                label: Text(
                                  "Password",
                                  style: TextStyle(
                                      color: hexToColor("E1E1E1"),
                                      fontSize: 15),
                                ),
                                filled: true,
                                hintText: "Hey Type Your password",
                                // enabledBorder: ,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                fillColor:
                                    hexToColor("11998E").withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      debugPrint(
                                          "Hey you passed The validation --------------->");
                                      await Loginuser();
                                    }
                                    ;
                                  },
                                  child: Text("Submit")))
                        ],
                      )),
                ),
              )

              // Form(
              //   key: globalKey,
              //   child: TextFormField(

              //   ),
              // )
            ],
          ),
        ));
  }
}


// import 'dart:convert';
 
// import 'package:flutter/material.dart';
// import 'package:incube_flutter_app/providers/loginProvider.dart';
// import 'package:incube_flutter_app/utils/color_functions.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
 
// class Loginscreen extends StatefulWidget {
//   const Loginscreen({
//     super.key,
//   });
 
//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }
 
// class _LoginscreenState extends State<Loginscreen> {
//   final formkey = GlobalKey<FormState>();
 
//   static String wiki_base_url2 = "https://mob-api.sustain-suite.com/mobile";
//   static String wiki_login_url2 =
//       "$wiki_base_url2/sharesuite/v1/web/wiki/article/login";
 
//   @override
//   void initState() {
//     super.initState();
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       // extendBody: true,
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.transparent,
//       body: Consumer<LogInProvider>(builder: (context, loginprovider, child) {
//         return Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.only(top: 40),
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: AssetImage("assets/images/login_bg.png"))),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_left,
//                       size: 25,
//                       color: hexToColor("E1E1E1"),
//                     ),
//                     Text(
//                       "Back",
//                       style:
//                           TextStyle(color: hexToColor("E1E1E1"), fontSize: 18),
//                     )
//                   ],
//                 ),
//               ),
 
//               SizedBox(
//                 height: h * 0.21,
//               ),
//               Image.asset(
//                 "assets/images/brand_name.png",
//                 scale: 1.7,
//               ),
//               Container(
//                 height: h * 0.5,
//                 width: w * 0.8,
//                 margin: EdgeInsets.only(top: 40),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: hexToColor("11998E").withOpacity(.2),
 
//                   // gradient: LinearGradient(colors: [
//                   //   hexToColor("000000").withOpacity(.5),
//                   //   hexToColor("11998E").withOpacity(.6),
//                   // ]),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: hexToColor("000000").withOpacity(.5),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   child: Form(
//                       key: formkey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextFormField(
//                             controller: loginprovider.username_textcontroller,
//                             validator: (value) {
//                               if (value != null) {
//                                 if (value.isNotEmpty) {
//                                   return null;
//                                 } else {
//                                   return "You must Enter a User name";
//                                 }
//                               } else {
//                                 return "You Have not enter any value";
//                               }
//                             },
//                             decoration: InputDecoration(
//                                 label: Text(
//                                   "UserName",
//                                   style: TextStyle(
//                                       color: hexToColor("E1E1E1"),
//                                       fontSize: 15),
//                                 ),
//                                 filled: true,
//                                 hintText: "Hey Type Your Username",
//                                 // enabledBorder: ,
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.white),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 fillColor:
//                                     hexToColor("11998E").withOpacity(0.5)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: loginprovider.pass_textcontroller,
//                             validator: (value) {
//                               if (value != null) {
//                                 if (value.isNotEmpty) {
//                                   return null;
//                                 } else {
//                                   return "You must Enter a Password";
//                                 }
//                               } else {
//                                 return "You Have not enter any value";
//                               }
//                             },
//                             decoration: InputDecoration(
//                                 label: Text(
//                                   "Password",
//                                   style: TextStyle(
//                                       color: hexToColor("E1E1E1"),
//                                       fontSize: 15),
//                                 ),
//                                 filled: true,
//                                 hintText: "Hey Type Your password",
//                                 // enabledBorder: ,
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.white),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 fillColor:
//                                     hexToColor("11998E").withOpacity(0.5)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                               width: MediaQuery.of(context).size.width * 0.3,
//                               child: ElevatedButton(
//                                   onPressed: () async {
//                                     if (formkey.currentState!.validate()) {
//                                       debugPrint(
//                                           "Hey you passed The validation --------------->");
//                                       await loginprovider.Loginuser();
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(
//                                             "Login Successful Your email is ${loginprovider.email} & your name is  ${loginprovider.name}"),
//                                         backgroundColor: Colors.green,
//                                       ));
//                                     }
//                                     ;
//                                   },
//                                   child: Text("Submit")))
//                         ],
//                       )),
//                 ),
//               )
 
//               // Form(
//               //   key: globalKey,
//               //   child: TextFormField(
 
//               //   ),
//               // )
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }