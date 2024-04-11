import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Login_provider extends ChangeNotifier {
  bool is_success = false;
  var user_id;
  var userName;
  var token;
  var email_id;
  var gender;
  var dob;
  Future post_db({required user_name, required password}) async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/api/login');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'user_name': user_name, 'password': password}));
      print(response.statusCode);
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final parse_response = jsonDecode(response.body);
        user_id = parse_response['user_id'];
        userName = parse_response['user_name'];
        token = parse_response['token'];
        email_id = parse_response['email'];

        gender = parse_response['gender'];
        dob = parse_response['dob'];
        print("token generated is $token");
        print("user id is ${user_id} and username is ${userName}");
        // print("email id for the user is===========$email_id");
        // print("dob id for the user is===========$dob");
        is_success = true;
        notifyListeners();
        return true;
      } else {
        is_success = false;
        print("Failed to post data");
        return false;
      }
    } catch (error) {
      print("Error posting data");
      return false;
    }
  }

  Future fetch_user_details({required user_name}) async {}
}
