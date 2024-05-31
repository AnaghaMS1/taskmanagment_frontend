import 'package:meta/meta.dart';
import 'dart:convert';

class LoginModel {
    List<Datum> data;

    LoginModel({
        required this.data,
    });

    LoginModel copyWith({
        List<Datum>? data,
    }) => 
        LoginModel(
            data: data ?? this.data,
        );

    factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String status;
    String message;
    int id;
    String email;
    String name;

    Datum({
        required this.status,
        required this.message,
        required this.id,
        required this.email,
        required this.name,
    });

    Datum copyWith({
        String? status,
        String? message,
        int? id,
        String? email,
        String? name,
    }) => 
        Datum(
            status: status ?? this.status,
            message: message ?? this.message,
            id: id ?? this.id,
            email: email ?? this.email,
            name: name ?? this.name,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
        message: json["message"],
        id: json["id"],
        email: json["email"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "email": email,
        "name": name,
    };
}
