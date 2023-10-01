import 'dart:convert';
import 'package:http/http.dart' as http;

const String BASE_URL = 'http://10.0.2.2:8000/api/';

Future<Map<String, dynamic>> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('${BASE_URL}login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return {'success': true, 'token': data['token']};
  } else {
    return {'success': false, 'message': 'Invalid credentials'};
  }
}

Future<Map<String, dynamic>> signup(String username, String email, String password, String firstname, String secondname, ) async {
  final response = await http.post(
    Uri.parse('${BASE_URL}signup/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstname': firstname,
      'secondname': secondname,
      'username': username,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return {'success': true, 'token': data['token']};
  } else {
    return {'success': false, 'message': 'Error creating account'};
  }
}


