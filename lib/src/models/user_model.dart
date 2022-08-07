import 'dart:convert';

UserModel userModelFromJson(Map<String, dynamic>? data) =>
    UserModel.fromJson(data!);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

  final String name;
  final String email;
  final String gender;
  final String birthday;
  final String height;

  UserModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.birthday,
    required this.height,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        birthday: json["birthday"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "birthday": birthday,
        "height": height,
      };
}
