import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';

final _storage = FlutterSecureStorage();
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
    // await _storage.write(key: 'token', value: data['token']);
    return {'success': true, 'data': data};
  } else {
    return {'success': false, 'message': 'Invalid credentials'};
  }
}

// Future<String?> getToken() async {
//   return await _storage.read(key: 'token');
// }

Future<Map<String, dynamic>> signup(String username, String email, String password, String firstname, String secondname, String userType, String gender, String birthday, String dentalDisease) async {
  final response = await http.post(
    Uri.parse('${BASE_URL}signup/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'first_name': firstname,
      'last_name': secondname,
      'username': username,
      'email': email,
      'password': password,
      'user_type':userType,
      'gender': gender,
      'birthday': birthday,
      'dental_disease': dentalDisease
    }),
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return {'success': true, 'token': data['token']};
  } else {
    return {'success': false, 'message': 'Error creating account'};
  }
}

class QuestionService {

  static Future<List<dynamic>> fetchQuestions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;
    var url = Uri.parse('${BASE_URL}questions/?user_id=$userId');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else if(response.statusCode == 404){
        return [];
    }
    else {
      throw Exception('Failed to load questions');
    }
  }

  static Future<Map<String, bool>> postAnswers(List<Map<String, dynamic>> answers) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}save_answers/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(answers),
    );

    if (response.statusCode == 201) {
      return {'success': true, 'data':json.decode(response.body)};
    } else {
      return {'success':false};
      throw Exception('Failed to load questions');
    }
  }
}


