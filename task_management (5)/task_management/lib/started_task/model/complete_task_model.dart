import 'package:meta/meta.dart';
import 'dart:convert';

class CompleteTaskModel {
    String data;

    CompleteTaskModel({
        required this.data,
    });

    CompleteTaskModel copyWith({
        String? data,
    }) => 
        CompleteTaskModel(
            data: data ?? this.data,
        );

    factory CompleteTaskModel.fromRawJson(String str) => CompleteTaskModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CompleteTaskModel.fromJson(Map<String, dynamic> json) => CompleteTaskModel(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}
