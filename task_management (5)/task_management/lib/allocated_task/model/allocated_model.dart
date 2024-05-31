import 'package:meta/meta.dart';
import 'dart:convert';

class AllocatedModel {
    List<Datum> data;

    AllocatedModel({
        required this.data,
    });

    AllocatedModel copyWith({
        List<Datum>? data,
    }) => 
        AllocatedModel(
            data: data ?? this.data,
        );

    factory AllocatedModel.fromRawJson(String str) => AllocatedModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllocatedModel.fromJson(Map<String, dynamic> json) => AllocatedModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String taskName;
    String priority;
    DateTime startDate;
    DateTime endDate;
    String taskDescription;
    String company;
    String status;

    Datum({
        required this.id,
        required this.taskName,
        required this.priority,
        required this.startDate,
        required this.endDate,
        required this.taskDescription,
        required this.company,
        required this.status,
    });

    Datum copyWith({
        int? id,
        String? taskName,
        String? priority,
        DateTime? startDate,
        DateTime? endDate,
        String? taskDescription,
        String? company,
        String? status,
    }) => 
        Datum(
            id: id ?? this.id,
            taskName: taskName ?? this.taskName,
            priority: priority ?? this.priority,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            taskDescription: taskDescription ?? this.taskDescription,
            company: company ?? this.company,
            status: status ?? this.status,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        taskName: json["task_name"],
        priority: json["priority"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        taskDescription: json["task_description"],
        company: json["company"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": taskName,
        "priority": priority,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "task_description": taskDescription,
        "company": company,
        "status": status,
    };
}
