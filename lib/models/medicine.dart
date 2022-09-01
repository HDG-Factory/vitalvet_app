class Medicine {
  int? id;
  String? name;

  Medicine({
    this.id,
    this.name,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"] == null ? null : json["id"] as int,
        name: json["name"],
      );

  /// Only name is required
  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
