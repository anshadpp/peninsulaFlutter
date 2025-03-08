import 'dart:convert';

import 'package:http/http.dart' as http;

String requestAction(
  String redirectTo,
) {
  var url = Uri.parse("http://213.136.93.14:8080/$redirectTo");
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  return "";
}

Future<String> redirectAction(dynamic action) async {
  var url = Uri.parse("http://213.136.93.14:8080/${action['redirectTo']}");
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  Map<String,dynamic> body = action['parameters'];
  body['actionName'] = action['actionName'];
  var response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(body),
  );
  if(response.statusCode == 200){
    var data = jsonDecode(response.body);
    return data['message'];
  }
  return "try again";
}
