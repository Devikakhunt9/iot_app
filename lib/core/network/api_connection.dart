import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiConnection extends GetxController {

  var client = http.Client();

  dynamic get(String endpoint) async {
    final url = Uri.parse(endpoint);
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Successful GET request
        return response.body;
      }
    }
    catch(e) {
      print("Exception in ger Request $endpoint");
    }
  }

  dynamic post(String endpoint, Map<String, String> data) async {
    final url = Uri.parse(endpoint);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(data);
    final response = await client.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Successful POST request
      return response.body;
    } else {
      // Handle errors, e.g., by throwing an exception
      throw Exception('Failed to post data');
    }
  }


}

