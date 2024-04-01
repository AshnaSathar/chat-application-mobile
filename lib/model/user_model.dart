import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  bool success;
  List<User> users;

  UsersModel({
    required this.success,
    required this.users,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        success: json["success"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String name;
  String userName;
  DateTime dob;
  Gender gender;
  String email;
  Status status;
  DateTime? lastActiveAt;
  DateTime? emailVerifiedAt;
  dynamic profilePicture;
  String? otp;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.dob,
    required this.gender,
    required this.email,
    required this.status,
    required this.lastActiveAt,
    required this.emailVerifiedAt,
    required this.profilePicture,
    required this.otp,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        dob: DateTime.parse(json["dob"]),
        gender: genderValues.map[json["gender"]]!,
        email: json["email"],
        status: statusValues.map[json["status"]]!,
        lastActiveAt: json["last_active_at"] == null
            ? null
            : DateTime.parse(json["last_active_at"]),
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        profilePicture: json["profile_picture"],
        otp: json["otp"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": genderValues.reverse[gender],
        "email": email,
        "status": statusValues.reverse[status],
        "last_active_at": lastActiveAt?.toIso8601String(),
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "profile_picture": profilePicture,
        "otp": otp,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Gender { FEMALE, MALE, OTHER }

final genderValues = EnumValues(
    {"female": Gender.FEMALE, "male": Gender.MALE, "other": Gender.OTHER});

enum Status { OFFLINE }

final statusValues = EnumValues({"offline": Status.OFFLINE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
