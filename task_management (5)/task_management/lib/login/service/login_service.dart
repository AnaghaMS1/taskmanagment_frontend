import 'dart:convert';
import 'dart:io';


import 'package:task_management/constants/urls.dart';
import 'package:task_management/login/model/login_model.dart';
import 'package:http/http.dart' as http;

Future<LoginModel> UserLogin({
  required String name,
  required String password,
}) async {
  try {
    Map param = {"email": name, "pswd": password, };
   
    final resp = await http.post(
      Uri.parse(Urls.Login),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      //return resp.body;
      final response = LoginModel.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
