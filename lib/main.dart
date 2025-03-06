import 'package:flutter/material.dart';
import 'package:peninsula_app/providers/communityProviders.dart';
import 'package:peninsula_app/providers/loginProviders.dart';
// import 'package:peninsula_app/login.dart';
// import 'package:peninsula_app/providers/loginProviders.dart';
import 'package:peninsula_app/providers/registrationProviders.dart';
import 'package:peninsula_app/registration/registration.dart';
// import 'package:peninsula_app/testingapi.dart';
import 'package:provider/provider.dart';

import 'community/community.dart';
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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const Login(),
      // home: const Loginscreen2(),
      home: const Community(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "username/email Id",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "password",
              ),
            ),
            ElevatedButton(onPressed: null, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
