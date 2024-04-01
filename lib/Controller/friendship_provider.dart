import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Friendship_provider extends ChangeNotifier {
  Future add_friend(
      {required user_id, required token, required friend_uid}) async {
    try {
      print("token received is $token");
      var url =
          Uri.parse("http://127.0.0.1:8000/api/users/$user_id/add-friends");
      // var response = await http.post(url,
      //     headers: {
      //       "Content-Type": "application/json",
      //       "Authorization": "Bearer $token"
      //     },
      //     body: jsonEncode({'friend_uid': friend_uid}));
      var request = await http.MultipartRequest('POST', url);
      request.headers['Authorization'] = "Bearer $token";
      request.fields['friend_id'] = friend_uid;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      print(response.statusCode);
      print('Response body: ${responseBody}');
      if (response.statusCode == 200) {
        print(responseBody);
        notifyListeners();
        return true;
      } else {
        print("failed");
        print(responseBody);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("error is $error");
    }
  }

  Future remove_friend({required friend_id}) async {
    notifyListeners();
  }
}
