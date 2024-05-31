import 'package:meta/meta.dart';
import 'dart:convert';

class FeedbackModel {
  List<Datum> data;

  FeedbackModel({
    required this.data,
  });

  FeedbackModel copyWith({
    List<Datum>? data,
  }) =>
      FeedbackModel(
        data: data ?? this.data,
      );

  factory FeedbackModel.fromRawJson(String str) =>
      FeedbackModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  var task;
  var feedback;

  Datum({
    required this.task,
    required this.feedback,
  });

  Datum copyWith({
    String? task,
    String? feedback,
  }) =>
      Datum(
        task: task ?? this.task,
        feedback: feedback ?? this.feedback,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        task: json["task"],
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "task": task,
        "feedback": feedback,
      };
}
