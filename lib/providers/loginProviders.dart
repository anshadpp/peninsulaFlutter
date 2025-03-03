import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  var username_textcontroller = TextEditingController();
  var password_textcontroller = TextEditingController();
  bool _loading = false;
  bool _success = false;
  String _message = "";
  String get message => _message;
  bool get loading => _loading;
  bool get success => _success;
  // String _name = "";
  // String _email = "";
  // String get name => _name;
  // String get email => _email;

  Future<void> loginuser() async {
    _success = false;
    _loading = true;
    notifyListeners();
    // var url = Uri.parse("https://dummyjson.com/auth/login");
    var url = Uri.parse("http://213.136.93.14:8080/login");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          'username': username_textcontroller.text,
          'password': password_textcontroller.text,
          "deviceToken": "eyJhdWQiOiJodHRwczovL2"
        }));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      _loading = false;
      if (data['status'] == 1) {
        _success = true;
        // _name = "${data['firstName']}  ${data['lastName']}";
        // _email =data['email'];
        _message = data['message'];
        notifyListeners();
      } else {
        _message = data['message'];
        notifyListeners();
      }
    }
    _loading = false;
    notifyListeners();
    debugPrint("working");
  }
}
