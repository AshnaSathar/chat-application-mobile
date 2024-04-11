import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/friend_list_model.dart';
import 'package:http/http.dart' as http;

class Friendship_provider extends ChangeNotifier {
  List<FriendListModel>? friends;
  FriendListModel? friendsModel;
  Future add_friend(
      {required user_id, required token, required friend_uid}) async {
    try {
      print("user_id is $user_id");
      print("friend_uid is $friend_uid");
      print("token received is $token");
      var url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/friends");
      var request = await http.MultipartRequest('POST', url);
      request.headers['Authorization'] = "Bearer $token";
      request.fields['friend_id'] = friend_uid.toString();
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

  Future get_friends({required user_id, required token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/friends");
      var response = await http.get(url,
          headers: ({
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          }));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        friendsModel = FriendListModel.fromJson(jsonData);
        notifyListeners();
      } else {
        print(response.body);
      }
    } catch (error) {
      print("error is: $error");
    }
  }

  Future remove_friend({required friend_id}) async {
    notifyListeners();
  }
}
