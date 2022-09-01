import 'package:vitalvet_app/models/user.dart';

class Profile {
  int? id;
  String? name;
  String? lastname;
  DateTime? birthday;
  String? picture;
  bool? admin;
  String? college;
  String? review;
  User? user;

  Profile({
    this.id,
    this.name,
    this.lastname,
    this.birthday,
    this.picture,
    this.admin,
    this.college,
    this.review,
    this.user,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] == null ? null : json["id"] as int,
        name: json["name"],
        lastname: json["lastname"],
        birthday: json["birthday"] == null
            ? null
            : DateTime.parse(json["birthday"] as String),
        picture: json["picture"],
        admin: json["admin"] == null ? null : json["admin"] as bool,
        college: json["college"],
        review: json["review"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  /// Name, lastname, birthday, college and review are required
  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "birthday": birthday == null ? null : birthday!.toIso8601String(),
        "picture": picture,
        "college": college,
        "review": review,
      };
}
