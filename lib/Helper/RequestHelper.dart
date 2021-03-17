import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestHelper {
  RequestHelper(this.url);
  final Uri url;
  Future getData() async {
    http.Response response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("Failed");
    }
  }

  Future postData(dynamic header, String body) async {
    http.Response response = await http.post(url, headers: header, body: body);

    try {
      if (response.statusCode == 201) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print("sdsdsdssd ${response.body}");
      }
    } catch (e) {
      print("Failed");
    }
  }
}
