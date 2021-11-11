import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/apis/members_api.dart';
import 'package:dsc_app/models/member/member_detail_model.dart';
import 'package:dsc_app/screens/member_screen/widgets/member_department_chips.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MemberDetailScreen extends StatelessWidget {
  static const tag = '/member-detail';

  const MemberDetailScreen({Key? key}) : super(key: key);

  Widget _eventInfoItem(String text, String info) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: info,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget _descriptionItem({required String title, required String icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icons/$icon'),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    );
  }

  Widget _extraInfoItem(MemberDetailModel member, BuildContext context) {
    return Wrap(
      children: [
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'githubUrl')
                .value !=
            '')
          if (member.name == 'Lương Đặng Hải Đăng')
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    final url = member.memberExtraInfo
                        .firstWhere((element) => element.key == 'githubUrl')
                        .value;
                    await launch(url);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/linkedin.svg',
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'githubUrl')
                .value !=
            '')
          if (member.name != 'Lương Đặng Hải Đăng')
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    final url = member.memberExtraInfo
                        .firstWhere((element) => element.key == 'githubUrl')
                        .value;
                    await launch(url);
                  },
                  icon: SvgPicture.asset('assets/icons/github.svg'),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
        if (member.email != '')
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                member.email,
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  Clipboard.setData(
                                      ClipboardData(text: member.email));
                                  await Fluttertoast.showToast(
                                      msg: "Copied to clipboard!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 2,
                                      fontSize: 16.0);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.copy,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'facebookUrl')
                .value !=
            '')
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  final url = member.memberExtraInfo
                      .firstWhere((element) => element.key == 'facebookUrl')
                      .value;
                  await launch(url);
                },
                icon: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'instagramUrl')
                .value !=
            '')
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  final url = member.memberExtraInfo
                      .firstWhere((element) => element.key == 'instagramUrl')
                      .value;
                  await launch(url);
                },
                icon: Icon(FontAwesomeIcons.instagram),
                iconSize: 27,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: MembersApi().getMemberDetail(id),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              MemberDetailModel member = snapshot.data as MemberDetailModel;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'THÀNH VIÊN',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.48,
                          color: Colors.white),
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                    expandedHeight: 210,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: member.avatarUrl,
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            placeholder: (_, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (_, error, url) => CachedNetworkImage(
                              imageUrl: DEFAULT_IMAGE_AVATAR,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              placeholder: (_, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff0D253C),
                                      Color(0x000D253C)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50),
                                ),
                              ),
                            ),
                            bottom: 0,
                            left: 0,
                            right: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'Gen ${member.generation}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              MemberDepartmentChips(
                                department: member.department,
                                isDetail: true,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            member.name,
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.72,
                                foreground: Paint()
                                  ..shader = LinearGradient(colors: [
                                    Color.fromRGBO(252, 96, 118, 1),
                                    Color.fromRGBO(252, 154, 68, 1)
                                  ]).createShader(
                                      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (member.memberExtraInfo
                                  .firstWhere(
                                      (element) => element.key == 'slogan')
                                  .value !=
                              '')
                            Text(
                              '\"${member.memberExtraInfo.firstWhere((element) => element.key == 'slogan').value}\"',
                              style: TextStyle(
                                  color: MAIN_COLOR,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          _descriptionItem(
                              title: member.role, icon: 'role.svg'),
                          const SizedBox(
                            height: 10,
                          ),
                          if (member.memberExtraInfo
                                  .firstWhere(
                                      (element) => element.key == 'hobby')
                                  .value !=
                              '')
                            _descriptionItem(
                                title: member.memberExtraInfo
                                    .firstWhere(
                                        (element) => element.key == 'hobby')
                                    .value,
                                icon: 'favorite.svg'),
                          const SizedBox(
                            height: 10,
                          ),
                          if (member.memberExtraInfo
                                  .firstWhere(
                                      (element) => element.key == 'major')
                                  .value !=
                              '')
                            _descriptionItem(
                                title: member.memberExtraInfo
                                    .firstWhere(
                                        (element) => element.key == 'major')
                                    .value,
                                icon: 'major.svg'),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Thông tin thêm',
                            style: TextStyle(
                                color: ERROR_COLOR,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          _extraInfoItem(member, context),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Bio',
                            style: TextStyle(
                                color: ERROR_COLOR,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (member.memberExtraInfo
                                  .firstWhere((element) => element.key == 'bio')
                                  .value !=
                              '')
                            Text(
                              member.memberExtraInfo
                                  .firstWhere((element) => element.key == 'bio')
                                  .value,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
