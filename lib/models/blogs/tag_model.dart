class TagModel {
  late int id;
  late String name;
  late String description;
  late int numberOfBlogs;

  TagModel({required this.id, required this.name, required this.description, required this.numberOfBlogs});

  TagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    numberOfBlogs = json['numberOfBlogs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['numberOfBlogs'] = this.numberOfBlogs;
    return data;
  }
}