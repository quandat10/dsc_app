class Event {
  String? title;
  String? imageUrl;
  String? date;
  String? description;
  String? location;
  String? category;

  Event(
      {required this.title,
        required this.imageUrl,
        required this.date,
        required this.description,
        required this.location,
        required this.category});

  Event.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    date = json['date'];
    description = json['description'];
    location = json['location'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['date'] = this.date;
    data['description'] = this.description;
    data['location'] = this.location;
    data['category'] = this.category;
    return data;
  }
}