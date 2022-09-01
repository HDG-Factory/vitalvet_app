class Patient {
  int? id;
  String? name;
  int? weight;
  DateTime? birthday;
  DateTime? dateOfDeath;
  String? mainPicture;
  int? subspeciesId;
  int? ownerId;
  int? profileId;
  DateTime? createdAt;

  Patient({
    this.id,
    this.name,
    this.weight,
    this.birthday,
    this.dateOfDeath,
    this.mainPicture,
    this.subspeciesId,
    this.ownerId,
    this.profileId,
    this.createdAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"] == null ? null : json["id"] as int,
        name: json["name"],
        weight: json["weight"] == null ? null : json["weight"] as int,
        birthday: json["birthday"] == null
            ? null
            : DateTime.parse(json["birthday"] as String),
        dateOfDeath: json["dateOfDeath"] == null
            ? null
            : DateTime.parse(json["dateOfDeath"] as String),
        mainPicture: json["mainPicture"],
        subspeciesId:
            json["subspeciesId"] == null ? null : json["subspeciesId"] as int,
        ownerId: json["ownerId"] == null ? null : json["ownerId"] as int,
        profileId: json["profileId"] == null ? null : json["profileId"] as int,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"] as String),
      );

  /// Name, weight, birthday, subspeciesId and ownerId are required
  Map<String, dynamic> toJson() => {
        "name": name,
        "weight": weight,
        "birthday": birthday == null ? null : birthday!.toIso8601String(),
        "subspeciesId": subspeciesId,
        "ownerId": ownerId,
        "profileId": profileId,
      };
}
