import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:snap_talk/constant/constant.dart';

class AuthService {
  var client = http.Client();

  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    const String serverUrl = Constant.serverUrl;

    Uri url = Uri.https(serverUrl, '/api/auth/logIn');

    final body = {
      'email': email,
      'password': password,
    };

    var response = await client.post(url, body: body);

    var json = jsonDecode(response.body);

    return {
      'status_code': response.statusCode,
      ...json,
    };
  }

  Future<Map> signUp(String name, String email, String password) async {
    const String serverUrl = Constant.serverUrl;

    Uri url = Uri.https(serverUrl, '/api/auth/signUp');

    final body = {
      'name': name,
      'email': email,
      'password': password,
    };

    var response = await client.post(url, body: body);

    var json = jsonDecode(response.body);

    return {
      'status_code': response.statusCode,
      ...json,
    };
  }

  Future<Map<String, dynamic>> sendVerificationEmail(String email) async {
    const String serverUrl = Constant.serverUrl;

    Uri url = Uri.https(serverUrl, '/api/auth/sendEmail');

    final body = {
      'email': email,
    };

    var response = await client.post(url, body: body);

    var json = jsonDecode(response.body);

    return {
      'status_code': response.statusCode,
      ...json,
    };
  }

  Future<Map<String, dynamic>> verifyEmail(String email, String otp) async {
    const String serverUrl = Constant.serverUrl;

    Uri url = Uri.https(serverUrl, '/api/auth/verifyEmail');

    final body = {
      'email': email,
      'otp': otp,
    };

    var response = await client.post(url, body: body);

    var json = jsonDecode(response.body);

    return {
      'status_code': response.statusCode,
      ...json,
    };
  }
}
