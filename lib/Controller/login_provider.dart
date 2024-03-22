import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Login_provider extends ChangeNotifier {
  bool is_success = false;

  Future post_db({required user_name, required password}) async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/api/login');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'user_name': user_name, 'password': password}));
      print(response.statusCode);
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        is_success = true;
        print(is_success);
        print("Post data successfully");
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
}
