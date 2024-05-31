import 'package:meta/meta.dart';
import 'dart:convert';

class StartTaskModel {
    String data;

    StartTaskModel({
        required this.data,
    });

    StartTaskModel copyWith({
        String? data,
    }) => 
        StartTaskModel(
            data: data ?? this.data,
        );

    factory StartTaskModel.fromRawJson(String str) => StartTaskModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StartTaskModel.fromJson(Map<String, dynamic> json) => StartTaskModel(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}
