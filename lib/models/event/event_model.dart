class EventModel {
  late int id;
  late String title;
  late String imageUrl;
  late String date;
  late String description;
  late String location;
  late String category;

  EventModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.location,
      required this.category});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      date: json['date'],
      description: json['description'] == null ? '' : json['description'],
      location: json['location'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['date'] = this.date;
    data['description'] = this.description;
    data['location'] = this.location;
    data['category'] = this.category;
    return data;
  }
}
