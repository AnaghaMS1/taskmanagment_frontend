import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:task_management/constants/urls.dart';
import 'package:task_management/started_task/model/update_task.dart';

Future<UpdateTaskModel>  updatetask_service({required int task_id, required double percents}
   ) async {
 
  Map map = {
    "id": task_id,
    "progress" : percents,
  };

  try {
    final resp = await http.post(
      Uri.parse(Urls.progress),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = UpdateTaskModel.fromJson(decoded);
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
