import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Otp_provider extends ChangeNotifier {
  var load = true;
  var reference_id;
  Future Send_otp({required email}) async {
    try {
      print(email);
      final url = Uri.parse("http://127.0.0.1:8000/api/send-otp");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');
      if (response.statusCode == 200) {
        final parsed_response = jsonDecode(responseBody);
        reference_id = parsed_response['reference_id'];
        load = false;
        print(responseBody);
        notifyListeners();
        return true;
      } else {
        print(responseBody);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("error is: $error");
    }
  }

  Future Verify_otp(
      {required otp, required reference_id, required user_id}) async {
    try {
      // final url = Uri.parse(uri);
    } catch (error) {
      print("error is: $error");
    }
  }
}
