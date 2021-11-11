class BlogModel {
  late int id;
  late String authorName;
  late String timeRelease;
  late String timeCreate;
  late String title;
  late String subTitle;
  late String coverImgUrl;
  late String thumbnailImgUrl;
  late List<String> blogTag;

  BlogModel(
      {required this.id,
        required this.authorName,
        required this.timeRelease,
        required this.timeCreate,
        required this.title,
        required this.subTitle,
        required this.coverImgUrl,
        required this.thumbnailImgUrl,
        required this.blogTag});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorName = json['authorName'];
    timeRelease = json['timeRelease'];
    timeCreate = json['timeCreate'];
    title = json['title'];
    subTitle = json['subTitle'];
    coverImgUrl = json['coverImgUrl'];
    thumbnailImgUrl = json['thumbnailImgUrl'];
    blogTag = json['blogTag'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorName'] = this.authorName;
    data['timeRelease'] = this.timeRelease;
    data['timeCreate'] = this.timeCreate;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['coverImgUrl'] = this.coverImgUrl;
    data['thumbnailImgUrl'] = this.thumbnailImgUrl;
    data['blogTag'] = this.blogTag;
    return data;
  }
}