import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Profile_updation_provider extends ChangeNotifier {
  Future post_update_data(
      {required context,
      required user_id,
      required user_name,
      required new_user_name,
      required token,
      required email_id,
      required new_email_id,
      required dob,
      required new_dob}) async {
    try {
      print("username is $user_name");
      print("username is $new_user_name");
      print("user_id is $user_id");
      print("email is $new_email_id");
      print("dob is $new_dob");
      var url = Uri.parse(
          "http://127.0.0.1:8000/api/user/userID=$user_id/profile/update");
      var response = await http.post(url,
          headers: {
            "content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            'user_name': user_name,
            'new_user_name': new_user_name,
            'dob': dob,
            'new_dob': new_dob,
            'email_id': email_id,
            'new_email_id': new_email_id
          }));
      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
        print(response.body);
        return false;
      }
    } catch (error) {
      print("Error : $error");
    }
  }
}
