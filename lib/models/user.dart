class User {
  int? id;
  String? email;
  String? password;

  User({
    this.id,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"] as int,
        email: json["email"],
        password: json["password"],
      );

  /// Email and password are required
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class Token {
  String? accessToken;
  int? expiresIn;
  String? refreshToken;

  Token({
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
        expiresIn: json["expires_in"] == null ? null : json["expiresIn"] as int,
        refreshToken: json["refreshToken"],
      );
}
