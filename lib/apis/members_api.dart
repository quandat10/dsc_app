import 'dart:convert';

import 'package:dsc_app/models/member/member_detail_model.dart';
import 'package:dsc_app/models/member/member_model.dart';
import 'package:http/http.dart' as http;

class MembersApi {
  Future<List<MemberModel>> getCoreTeamMember({required int pageKey, int size = 5}) async {
    List<MemberModel> members = <MemberModel>[];
    var request = http.Request('GET',
        Uri.parse('http://188.166.219.131:8000/api/v1/members/core-team?page=$pageKey&size=$size'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return data["result"]
            .map<MemberModel>((json) => MemberModel.fromJson(json))
            .toList();
      }
    } else {
      print(response.reasonPhrase);
    }
    return members;
  }

  Future<List<MemberModel>> getMembersGen({required int gen, required int pageKey, int size = 5}) async {
    List<MemberModel> members = <MemberModel>[];
    var request = http.Request('GET',
        Uri.parse('http://188.166.219.131:8000/api/v1/members/gen-$gen?page=$pageKey&size=$size'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        print(data);
        return data["result"]
            .map<MemberModel>((json) => MemberModel.fromJson(json))
            .toList();
      }
    } else {
      print(response.reasonPhrase);
    }
    return members;
  }

  Future<int> getGenNumber() async {
    var number = 0;
    var request = http.Request(
        'GET', Uri.parse('http://188.166.219.131:8000/api/v1/members/gen/numbers'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return data['result']['numberOfGenerations'];
      }
    } else {
      print(response.reasonPhrase);
    }
    return number;
  }

  Future<MemberDetailModel> getMemberDetail(int id) async {
    MemberDetailModel member = MemberDetailModel(
        id: 0,
        name: '',
        joinedDate: '',
        birthDate: '',
        role: '',
        gender: '',
        avatarUrl: '',
        generation: -1,
        email: '',
        department: '',
        memberExtraInfo: [MemberExtraInfo(key: '', value: '')]);
    var request = http.Request(
        'GET', Uri.parse('http://188.166.219.131:8000/api/v1/members/$id'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return MemberDetailModel.fromJson(data['result']);
      }
    } else {
      print(response.reasonPhrase);
    }
    return member;
  }
}
