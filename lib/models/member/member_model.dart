class MemberModel {
  late int id;
  late String name;
  late String role;
  late String gender;
  late String avatarUrl;
  late int generation;
  late String department;

  MemberModel(
      {required this.id,
        required this.name,
        required this.role,
        required this.gender,
        required this.avatarUrl,
        required this.generation,
        required this.department});

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    gender = '';
    avatarUrl = json['avatarUrl'];
    generation = json['generation'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['avatarUrl'] = this.avatarUrl;
    data['generation'] = this.generation;
    data['department'] = this.department;
    return data;
  }
}