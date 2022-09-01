class Owner {
  int? id;
  String? name;
  String? lastname;
  DateTime? birthday;
  String? direction;
  String? phone;
  String? dni;
  String? email;

  Owner({
    this.id,
    this.name,
    this.lastname,
    this.birthday,
    this.direction,
    this.phone,
    this.dni,
    this.email,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"] == null ? null : json["id"] as int,
        name: json["name"],
        lastname: json["lastname"],
        birthday: json["birthday"] == null
            ? null
            : DateTime.parse(json["birthday"] as String),
        direction: json["direction"],
        phone: json["phone"],
        dni: json["dni"],
        email: json["email"],
      );

  /// Name, lastname, birthday, direction and phone are required
  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "birthday": birthday == null ? null : birthday!.toIso8601String(),
        "direction": direction,
        "phone": phone,
        "dni": dni,
        "email": email,
      };
}
