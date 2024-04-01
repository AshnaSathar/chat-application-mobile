import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Forget_password_provider extends ChangeNotifier {
  var user_name;

  Future get_data({required email_id}) async {
    try {
      print(email_id);
      final url = Uri.parse(
          "http://127.0.0.1:8000/api/users/get-by-email?email=$email_id");
      final response = await http.get(url);
      print("Status code = ${response.statusCode}");
      print("Response body = ${response.body}");
      if (response.statusCode == 200) {
        final parsed_response = jsonDecode(response.body);
        final user = parsed_response['user'];
        user_name = user['user_name'];
        print("user_name is $user_name");
        print(response.statusCode);
        return true;
      } else {
        print("user not found");
        print(response.statusCode);
        return false;
      }
    } catch (error) {
      print("Error: $error");
    }
    notifyListeners();
  }

  Future send_otp_to_email({required email_id}) async {
    try {
      print(email_id);
      final url = Uri.parse("http://127.0.0.1:8000/api/password/reset-otp");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email_id;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      print("hey inside send otp email");
      print(responseBody);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Response body is ${responseBody}");
        return true;
      }
    } catch (error) {
      print("Error : $error");
    }
    notifyListeners();
  }

  Future post_reset_password(
      {required email_id,
      required otp,
      required new_password,
      required password_confirmation}) async {
    try {
      print(email_id);
      print(otp);
      print(password_confirmation);
      print(new_password);
      final url = Uri.parse("http://127.0.0.1:8000/api/password/reset");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email_id;
      request.fields['otp'] = otp;
      request.fields['password'] = new_password;
      request.fields['password_confirmation'] = password_confirmation;
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
      print("Error : $error");
    }
    notifyListeners();
  }

  // Future post_db_forget(
  //     {required user_id,
  //     required new_password,
  //     required confirmation_password}) async {
  //   try {} catch (error) {
  //     print("Error : $error");
  //   }
  //   notifyListeners();
  // }

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
