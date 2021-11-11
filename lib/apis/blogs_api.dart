import 'package:dsc_app/models/blogs/blog_detail_model.dart';
import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/models/blogs/tag_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum GetNumber { All, Limited }

class BlogsApi {
  Future<List<BlogModel>> getBlogs(
      {required GetNumber numberMode, int number = 3}) async {
    var url = '';
    if (numberMode == GetNumber.All) {
      url =
          'http://188.166.219.131:8000/api/v1/blogs?page=0&size=200&sort=timeCreate,desc';
    } else {
      url =
          'http://188.166.219.131:8000/api/v1/blogs?sort=timeCreate,desc&page=0&size=$number';
    }
    List<BlogModel> blogs = <BlogModel>[];
    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return data["result"]
            .map<BlogModel>((json) => BlogModel.fromJson(json))
            .toList();
      }
    } else {
      print(response.reasonPhrase);
    }
    return blogs;
  }

  Future<BlogModel> getBlogsById(int id) async {
    BlogModel blog = BlogModel(
        id: -1,
        authorName: '',
        timeRelease: '',
        timeCreate: '',
        title: '',
        subTitle: '',
        coverImgUrl: '',
        thumbnailImgUrl: '',
        blogTag: []);
    var request = http.Request(
        'GET', Uri.parse('http://188.166.219.131:8000/api/v1/blogs/$id'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return BlogModel.fromJson(data['result']);
      }
    } else {
      print(response.reasonPhrase);
    }
    return blog;
  }

  Future<BlogDetailModel> getBlogDetails(int id) async {
    BlogDetailModel blog = BlogDetailModel(
        id: -1,
        rawContent: '',
        authorName: '',
        timeRelease: '',
        timeCreate: '',
        title: '',
        subTitle: '',
        coverImgUrl: '',
        thumbnailImgUrl: '',
        blogTag: []);
    var request = http.Request(
        'GET', Uri.parse('http://188.166.219.131:8000/api/v1/blogs/$id'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return BlogDetailModel.fromJson(data['result']);
      }
    } else {
      print(response.reasonPhrase);
    }
    return blog;
  }

  Future<List<BlogModel>> getBlogsByTag(String tag,
      {required int pageKey, int pageSize = 20}) async {
    var url = '';
    if (tag == 'Tất cả') {
      url =
          'http://188.166.219.131:8000/api/v1/blogs?page=$pageKey&sort=timeCreate,desc';
    } else {
      url =
          'http://188.166.219.131:8000/api/v1/blogs/tag?name=$tag&page=$pageKey&size=$pageSize&sort=timeCreate,desc';
    }
    List<BlogModel> blogs = <BlogModel>[];
    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        print(data);
        return data["result"]
            .map<BlogModel>((json) => BlogModel.fromJson(json))
            .toList();
      }
    } else {
      print(response.reasonPhrase);
    }
    return blogs;
  }

  Future<List<TagModel>> getTags() async {
    List<TagModel> tags = [];
    var request = http.Request('GET',
        Uri.parse('http://188.166.219.131:8000/api/v1/blogs/tag/filters'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        return data['result']
            .map<TagModel>((json) => TagModel.fromJson(json))
            .toList();
      }
    } else {
      print(response.reasonPhrase);
    }

    return tags;
  }
}
