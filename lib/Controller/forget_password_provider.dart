import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Forget_password_provider extends ChangeNotifier {
  Future post_db_forget(
      {required user_id,
      required new_password,
      required confirmation_password}) async {
    try {} catch (error) {
      print("Error : $error");
    }
    notifyListeners();
  }

  Future post_db_update(
      {required user_id,
      required old_password,
      required new_password,
      required new_confirmation_password}) async {
    try {
      final url =
          Uri.parse("http://127.0.01:8000/api/users/$user_id/password-update");
      var request = http.MultipartRequest('POST', url);
      request.fields['old_password'] = old_password;
      request.fields['new_password'] = new_password;
      request.fields['new_confirmation_password'] = new_confirmation_password;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      print("Response status : ${response.statusCode}");
      print("Response body : ${responseBody}");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Eroor:$error");
      return false;
    }
  }
}
