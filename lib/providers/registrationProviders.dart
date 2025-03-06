import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registrationprovider extends ChangeNotifier {
  var firstName_text_controller = TextEditingController();
  var lastName_text_controller = TextEditingController();
  var phoneNumber_text_controller = TextEditingController();
  var email_text_controller = TextEditingController();
  bool _loading = false;
  bool _success = false;
  String _message = "";
  String get message => _message;
  bool get loading => _loading;
  bool get success => _success;

  List<dynamic> dropdownItems = [];
  String? dropdownValue;

  Future<void> fetchDropdownItems() async{
    var url = Uri.parse("http://213.136.93.14:8080/registrationUi");
    Map<String,String> headers = {
      "content-type":"application/json",
      "accept":"application/json"
    };
    var response = await http.get(url,headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == 1) {
        dropdownItems = data['parameters']['user']['countryCodes'];
        if(dropdownItems.isNotEmpty){
          dropdownValue = dropdownItems.first['id'].toString();
        }

        notifyListeners();
      }
    }

  }

  void updateDropdownValue(String newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }


  Future<void> registration() async {
    _success = false;
    _loading =true;
    notifyListeners();
    var url = Uri.parse("http://213.136.93.14:8080/registration");
    Map<String,String> headers = {
      "content-type":"application/json",
      "accept":"application/json"
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        "firstName":firstName_text_controller.text,
        "lastName":lastName_text_controller.text,
        "email":email_text_controller.text,
        "phoneNumber":phoneNumber_text_controller.text,
        "countryCodeId":dropdownValue
      })
    );
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
