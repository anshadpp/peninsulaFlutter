import 'package:flutter/material.dart';
import 'package:peninsula_app/login/login.dart';
import 'package:peninsula_app/providers/communityProviders.dart';
import 'package:peninsula_app/providers/loginProviders.dart';
// import 'package:peninsula_app/login.dart';
// import 'package:peninsula_app/providers/loginProviders.dart';
import 'package:peninsula_app/providers/registrationProviders.dart';
import 'package:peninsula_app/registration/registration.dart';
// import 'package:peninsula_app/testingapi.dart';
import 'package:provider/provider.dart';

import 'community/community.dart';
import 'utils/utils.dart';
// import 'package:peninsula_app/sample.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Registrationprovider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => Communityprovider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routes: {
        "/":(context)=>MyHomePage(),
        "/login":(context)=>Login(),
        "/register":(context)=>Registration(),
        "/community":(context)=>Community(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const Login(),
      // home: const Loginscreen2(),
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final effectiveWidth = deviceWidth > 600 ? 600.0 : deviceWidth;
    final effectiveHeight = deviceHeight > 852 ? 852.0 : deviceHeight;

    double widthRatio = effectiveWidth / 393.0;
    double heightRatio = effectiveHeight / 852.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: registrationAndLoginBackground(),
          child: Stack(
            children: [
              Positioned(
                  top: heightRatio * 198,
                  left: widthRatio * 110.87,
                  child: Container(
                    width: widthRatio * 170.25,
                    height: heightRatio * 38.19,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/peninsulaLogoWithName.png"),
                            fit: BoxFit.fill)),
                  )),
              homeButton(
                  heightRatio: heightRatio,
                  widthRatio: widthRatio,
                  title: "Login/Register",
                  left: 32,
                  top: 416,
                  onTap: (){
                    Navigator.pushNamed(context, "/login");
                  }),
              homeButton(
                  heightRatio: heightRatio,
                  widthRatio: widthRatio,
                  title: "Community",
                  left: 32,
                  top: 480,
                  image: "assets/images/logoForButton.png",
                  onTap: () {
                    Navigator.pushNamed(context, "/community");
                  },)
            ],
          ),
        ),
      ),
    );
  }
}

Widget homeButton(
    {required double top,
    required double left,
    required String title,
    required double heightRatio,
    required double widthRatio,
    String? image,
    required void Function() onTap}) {
  return Positioned(
    top: heightRatio * top,
    left: widthRatio * left,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthRatio * 329,
        height: heightRatio * 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35)),
          border: Border.all(color: hexToColor("#38EF7D"), width: 2),
          gradient: LinearGradient(
            // colors: [hexToColor("#38EF7D"), hexToColor("#11998E")]
            // colors: [
            //   Colors.teal.withOpacity(0.6),
            //   Colors.teal.withOpacity(0.6)
            // ],
            colors: [
              Color.fromRGBO(56, 239, 125, 0.3),
              Color.fromRGBO(17, 153, 142, 0.3)
            ],
          ),
        ),
        child: Center(
          child: image == null
              ? Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: heightRatio * 21,
                      width: 18.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image), fit: BoxFit.fill)),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
        ),
      ),
    ),
  );
}
