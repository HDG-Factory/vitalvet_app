class Species {
  int? id;
  String? name;
  int? speciesId;
  List<Species>? subspecies;

  Species({
    this.id,
    this.name,
    this.speciesId,
    this.subspecies,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        id: json["id"] == null ? null : json["id"] as int,
        name: json["name"],
        speciesId: json["speciesId"] == null ? null : json["speciesId"] as int,
        subspecies: json["subspecies"] == null
            ? null
            : List<Species>.from(
                json["subspecies"].map((x) => Species.fromJson(x))),
      );

  /// Only name is required
  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
