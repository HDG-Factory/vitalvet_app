class Event {
  int? id;
  String? title;
  String? description;
  DateTime? startTime;
  DateTime? endTime;
  int? patientId;
  int? profileId;
  int? eventTypeId;

  Event({
    this.id,
    this.title,
    this.description,
    this.startTime,
    this.endTime,
    this.patientId,
    this.profileId,
    this.eventTypeId,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"] == null ? null : json["id"] as int,
        title: json["title"],
        description: json["description"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"] as String),
        endTime: json["endTime"] == null
            ? null
            : DateTime.parse(json["endTime"] as String),
        patientId: json["patientId"] == null ? null : json["patientId"] as int,
        profileId: json["profileId"] == null ? null : json["profileId"] as int,
        eventTypeId:
            json["eventTypeId"] == null ? null : json["eventTypeId"] as int,
      );

  /// Title, description, startTime and eventTypeId are required
  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "startTime": startTime == null ? null : startTime!.toIso8601String(),
        "endTime": endTime == null ? null : endTime!.toIso8601String(),
        "patientId": patientId,
        "eventTypeId": eventTypeId,
      };
}
