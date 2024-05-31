import 'package:meta/meta.dart';
import 'dart:convert';

class HomeTaskModel {
    List<Datum> data;

    HomeTaskModel({
        required this.data,
    });

    HomeTaskModel copyWith({
        List<Datum>? data,
    }) => 
        HomeTaskModel(
            data: data ?? this.data,
        );

    factory HomeTaskModel.fromRawJson(String str) => HomeTaskModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HomeTaskModel.fromJson(Map<String, dynamic> json) => HomeTaskModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int task;
    int pending;
    int ongoing;
    int completed;

    Datum({
        required this.task,
        required this.pending,
        required this.ongoing,
        required this.completed,
    });

    Datum copyWith({
        int? task,
        int? pending,
        int? ongoing,
        int? completed,
    }) => 
        Datum(
            task: task ?? this.task,
            pending: pending ?? this.pending,
            ongoing: ongoing ?? this.ongoing,
            completed: completed ?? this.completed,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        task: json["task"],
        pending: json["pending"],
        ongoing: json["ongoing"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "task": task,
        "pending": pending,
        "ongoing": ongoing,
        "completed": completed,
    };
}
