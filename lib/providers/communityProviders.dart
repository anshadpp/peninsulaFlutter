
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Communityprovider extends ChangeNotifier{
    List<dynamic> posts =[];

  Future<void> getPosts() async{
    var url = Uri.parse("http://213.136.93.14:8080/community");
    Map<String,String> headers = {
      "content-type":"application/json",
      "accept":"application/json"
    };
    var response = await http.get(url,headers: headers);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      posts = data['parameters']['posts'];
      
      notifyListeners();
    }

  }


}