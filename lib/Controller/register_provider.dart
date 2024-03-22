import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Register_provider extends ChangeNotifier {
  bool is_success = false;
  Future post_db(
      {required name,
      required email,
      required password,
      required password_confirmation,
      required user_name,
      required gender,
      required dob}) async {
    try {
      print("$dob");
      print("invoked register provider");
      final url = Uri.parse("http://127.0.0.1:8000/api/register");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['password_confirmation'] = password_confirmation;
      request.fields['name'] = name;
      request.fields['user_name'] = user_name;
      request.fields['gender'] = gender;
      request.fields['dob'] = dob;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');
      if (response.statusCode == 200) {
        is_success = true;
        return true;
      } else {
        is_success = false;
        return false;
      }
      // var response = await http.post(url,
      //     headers: {"Content-Type": "application/json"},
      //     body: jsonEncode({
      //       'email': email,
      //       'password': password,
      //       'password_confirmation': password_confirmation,
      //       'user_name': user_name,
      //       'gender': gender,
      //       'dob': dob
      //     }));
      // if (response.statusCode == 200) {
      //   print("Post data successfully");
      // } else {
      //   print("Error posting data");
      // }
    } catch (error) {
      print("Error posting data $error");
    }
    notifyListeners();
  }
}
