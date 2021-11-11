class EventModel {
  late int id;
  late String title;
  late String imageUrl;
  late String time;
  late String description;
  late List<Guests> guests;
  late EventUrl eventUrl;
  late Location location;
  late String status;

  EventModel(
      {required this.id,
        required this.title,
        required this.imageUrl,
        required this.time,
        required this.description,
        required this.guests,
        required this.eventUrl,
        required this.location,
        required this.status});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    time = json['time'];
    description = json['description'];
    if (json['guests'] != null) {
      guests = <Guests>[];
      json['guests'].forEach((v) {
        guests.add(new Guests.fromJson(v));
      });
    }
    eventUrl = EventUrl.fromJson(json['eventUrl']);
    location = Location.fromJson(json['location']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['time'] = this.time;
    data['description'] = this.description;
    if (this.guests != null) {
      data['guests'] = this.guests.map((v) => v.toJson()).toList();
    }
    if (this.eventUrl != null) {
      data['eventUrl'] = this.eventUrl.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Guests {
  late int id;
  late String avatarUrl;
  late String name;
  late String role;
  late String company;

  Guests({required this.id, required this.avatarUrl, required this.name, required this.role, required this.company});

  Guests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatarUrl = json['avatarUrl'];
    name = json['name'];
    role = json['role'];
    company = json['company'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatarUrl'] = this.avatarUrl;
    data['name'] = this.name;
    data['role'] = this.role;
    data['company'] = this.company;
    return data;
  }
}

class EventUrl {
  late String info;
  late String register;

  EventUrl({required this.info, required this.register});

  EventUrl.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    register = json['register'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['info'] = this.info;
    data['register'] = this.register;
    return data;
  }
}

class Location {
  late String name;
  late String address;

  Location({required this.name, required this.address});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}