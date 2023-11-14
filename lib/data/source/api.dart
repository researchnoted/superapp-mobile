import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:superapp_mobile/data/model/request/register_model.dart';
import 'package:superapp_mobile/data/model/response/register_response_model.dart';

class ApiDataSource {

  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('http://192.168.43.63:8000/api/register'),
      body: registerModel.toMap(),
    );

    Logger().i(response.statusCode);

    if (response.statusCode == 200) {
      final result = RegisterResponseModel.fromMap(json.decode(response.body));
      return result;
    } else if (response.statusCode == 302) {
      // Handle the redirect
      final redirectUrl = response.headers['location'];
      if (redirectUrl != null) {
        final redirectedResponse = await http.get(Uri.parse(redirectUrl));
        // Handle the redirected response as needed
        Logger().i('Redirected Response: ${redirectedResponse.body}');
        return RegisterResponseModel.fromMap(json.decode(redirectedResponse.body));
      } else {
        throw Exception('Failed to follow redirect: Redirect URL not found in headers');
      }
    } else {
      throw Exception('Failed to register user: ${response.statusCode}');
    }
  }

}