import 'dart:convert';

import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogsProvider with ChangeNotifier {
  static const BLOG_KEY = 'SAVED_BLOGS';
  List<BlogModel> _savedBlogs = [];

  List<BlogModel> get savedBlogs {
    return [..._savedBlogs];
  }

  void getBlogListFromDevice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? deviceData = sharedPreferences.getString(BLOG_KEY);
    if (deviceData == null)
      return;
    else {
      List<BlogModel> _deviceSavedBlogs =
          (json.decode(sharedPreferences.getString(BLOG_KEY) as String)
                  as List<dynamic>)
              .map<BlogModel>((e) => BlogModel.fromJson(e))
              .toList();
      _savedBlogs = _deviceSavedBlogs;
    }
  }

  void addBlogToSaveList(BlogModel blog) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_savedBlogs.any((element) => element.id == blog.id))
      return;
    else {
      final temp = BlogModel(
          id: blog.id,
          authorName: blog.authorName,
          timeRelease: blog.timeRelease,
          timeCreate: blog.timeCreate,
          title: blog.title,
          subTitle: blog.subTitle,
          coverImgUrl: blog.coverImgUrl,
          thumbnailImgUrl: blog.thumbnailImgUrl,
          blogTag: blog.blogTag);
      _savedBlogs.add(temp);
    }
    sharedPreferences.setString(
        BLOG_KEY, json.encode(_savedBlogs.map((e) => e.toJson()).toList()));
    Fluttertoast.showToast(
        msg: 'Đã lưu bài viết!',
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.CENTER);
    notifyListeners();
  }

  void removeBlogFromList(BlogModel blog) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!_savedBlogs.any((element) => element.id == blog.id))
      return;
    else
      _savedBlogs.removeWhere((element) => element.id == blog.id);
    sharedPreferences.setString(
        BLOG_KEY, json.encode(_savedBlogs.map((e) => e.toJson()).toList()));
    Fluttertoast.showToast(
        msg: 'Đã bỏ lưu bài viết!',
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.CENTER);
    notifyListeners();
  }
}
