class EventType {
  int? id;
  String? name;
  String? typeColor;

  EventType({
    this.id,
    this.name,
    this.typeColor,
  });

  factory EventType.fromJson(Map<String, dynamic> json) => EventType(
        id: json["id"] == null ? null : json["id"] as int,
        name: json["name"],
        typeColor: json["typeColor"],
      );

  /// Name and typeColor are required
  Map<String, dynamic> toJson() => {
        "name": name,
        "typeColor": typeColor,
      };
}
