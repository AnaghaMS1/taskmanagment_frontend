import 'package:meta/meta.dart';
import 'dart:convert';

class ProfileModel {
    List<Datum> data;

    ProfileModel({
        required this.data,
    });

    ProfileModel copyWith({
        List<Datum>? data,
    }) => 
        ProfileModel(
            data: data ?? this.data,
        );

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String password;
    String email;
    String phone;
    String designation;
    String role;
    String company;

    Datum({
        required this.id,
        required this.name,
        required this.password,
        required this.email,
        required this.phone,
        required this.designation,
        required this.role,
        required this.company,
    });

    Datum copyWith({
        int? id,
        String? name,
        String? password,
        String? email,
        String? phone,
        String? designation,
        String? role,
        String? company,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            password: password ?? this.password,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            designation: designation ?? this.designation,
            role: role ?? this.role,
            company: company ?? this.company,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        designation: json["designation"],
        role: json["role"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
        "email": email,
        "phone": phone,
        "designation": designation,
        "role": role,
        "company": company,
    };
}
