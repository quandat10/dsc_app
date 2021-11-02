import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/apis/members_api.dart';
import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/models/member/member_detail_model.dart';
import 'package:dsc_app/screens/event_screen/widgets/member_department_chips.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  Widget _descriptionItem({required String title, required IconData icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 20,
        ),
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

  Widget _extraInfoItem(MemberDetailModel member) {
    return Wrap(
      children: [
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'githubUrl')
                .value !=
            '')
          Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.github),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        if (member.email != '')
          Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.google),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'facebookUrl')
                .value !=
            '')
          Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.facebook),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        if (member.memberExtraInfo
                .firstWhere((element) => element.key == 'instagramUrl')
                .value !=
            '')
          Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.instagram),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
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
                          letterSpacing: -1,
                          color: Colors.white),
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    expandedHeight: 210,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        children: [
                          Hero(
                            tag: member.id,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: member.avatarUrl,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              placeholder: (_, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (_, error, url) =>
                                  CachedNetworkImage(
                                imageUrl: DEFAULT_IMAGE_AVATAR,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                placeholder: (_, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
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
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            member.name,
                            style: TextStyle(
                                color: ERROR_COLOR,
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1),
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
                              title: member.role, icon: FontAwesomeIcons.male),
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
                                icon: Icons.favorite),
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
                                icon: FontAwesomeIcons.graduationCap),
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
                          _extraInfoItem(member),
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
                                  .firstWhere((element) => element.key == 'bio').value,
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
