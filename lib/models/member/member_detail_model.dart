class MemberDetailModel {
  late int id;
  late String name;
  late String joinedDate;
  late String birthDate;
  late String role;
  late String gender;
  late String avatarUrl;
  late int generation;
  late String email;
  late String department;
  late List<MemberExtraInfo> memberExtraInfo;

  MemberDetailModel(
      {required this.id,
        required this.name,
        required this.joinedDate,
        required this.birthDate,
        required this.role,
        required this.gender,
        required this.avatarUrl,
        required this.generation,
        required this.email,
        required this.department,
        required this.memberExtraInfo});

  MemberDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    joinedDate = json['joinedDate'];
    birthDate = json['birthDate'];
    role = json['role'] ?? '';
    gender = json['gender'] ?? '';
    avatarUrl = json['avatarUrl'];
    generation = json['generation'];
    email = json['email'] ?? '';
    department = json['department'];
    if (json['memberExtraInfo'] != null) {
      memberExtraInfo = [];
      json['memberExtraInfo'].forEach((v) {
        memberExtraInfo.add(new MemberExtraInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['joinedDate'] = this.joinedDate;
    data['birthDate'] = this.birthDate;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['avatarUrl'] = this.avatarUrl;
    data['generation'] = this.generation;
    data['email'] = this.email;
    data['department'] = this.department;
    if (this.memberExtraInfo != null) {
      data['memberExtraInfo'] =
          this.memberExtraInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberExtraInfo {
  late String key;
  late String value;

  MemberExtraInfo({required this.key, required this.value});

  MemberExtraInfo.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}