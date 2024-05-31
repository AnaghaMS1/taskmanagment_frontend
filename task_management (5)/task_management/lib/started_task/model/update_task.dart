import 'package:meta/meta.dart';
import 'dart:convert';

class UpdateTaskModel {
    String data;

    UpdateTaskModel({
        required this.data,
    });

    UpdateTaskModel copyWith({
        String? data,
    }) => 
        UpdateTaskModel(
            data: data ?? this.data,
        );

    factory UpdateTaskModel.fromRawJson(String str) => UpdateTaskModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateTaskModel.fromJson(Map<String, dynamic> json) => UpdateTaskModel(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}
