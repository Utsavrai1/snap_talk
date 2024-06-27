import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:snap_talk/constant/constant.dart';

class AuthService {
  var client = http.Client();
  final _headers = {
    'Content-Type': 'application/json',
  };

  Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    const String serverUrl = Constant.serverUrl;

    Uri url = Uri.https(serverUrl, '/api/v1/auth/login');

    final body = {
      'username': username,
      'password': password,
    };

    var response =
        await client.post(url, headers: _headers, body: jsonEncode(body));

    var json = jsonDecode(response.body);

    return {
      'status_code': response.statusCode,
      ...json,
    };
  }

  Future<Map> signUp(
    String name,
    String username,
    String password,
    String confirmPassword,
    String gender,
  ) async {
    const String serverUrl = Constant.serverUrl;

    Uri url = Uri.https(serverUrl, '/api/v1/auth/signUp');

    final body = {
      'fullName': name,
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
      'gender': gender,
    };

    var response =
        await client.post(url, headers: _headers, body: jsonEncode(body));

    var json = jsonDecode(response.body);

    return {
      'status_code': response.statusCode,
      ...json,
    };
  }
}
