import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:task_management/allocated_task/model/allocated_model.dart';
import 'package:task_management/constants/urls.dart';
import 'package:task_management/home/model/home_model.dart';
import 'package:task_management/completed_task/model/completed_task_model.dart';

Future<CompletedTaskModel> completed_task_service(
   ) async {
  Box? box1;
  box1 = await Hive.openBox('logindata');
  print(box1.get('id'));
  Map map = {
    "id": box1.get('id'),
  };

  try {
    final resp = await http.post(
      Uri.parse(Urls.completed_task),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = CompletedTaskModel.fromJson(decoded);
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
