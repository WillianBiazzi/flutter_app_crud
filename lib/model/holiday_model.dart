class HolidayEntity {
  String? date;
  String? name;
  String? type;

  HolidayEntity({this.date, this.name, this.type});

  factory HolidayEntity.fromJson(Map<String, dynamic> json) {
    return HolidayEntity(
      date: json['date'],
      name: json['name'],
      type: json['type'],
    );
  }
}
