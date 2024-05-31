import 'package:meta/meta.dart';
import 'dart:convert';

class LeaderboredModel {
    List<Datum> data;

    LeaderboredModel({
        required this.data,
    });

    LeaderboredModel copyWith({
        List<Datum>? data,
    }) => 
        LeaderboredModel(
            data: data ?? this.data,
        );

    factory LeaderboredModel.fromRawJson(String str) => LeaderboredModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LeaderboredModel.fromJson(Map<String, dynamic> json) => LeaderboredModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String employee;
    String point;

    Datum({
        required this.employee,
        required this.point,
    });

    Datum copyWith({
        String? employee,
        String? point,
    }) => 
        Datum(
            employee: employee ?? this.employee,
            point: point ?? this.point,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        employee: json["employee"],
        point: json["point"],
    );

    Map<String, dynamic> toJson() => {
        "employee": employee,
        "point": point,
    };
}
