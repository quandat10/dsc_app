import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/models/member/member_model.dart';
import 'package:dsc_app/screens/member_screen/widgets/member_department_chips.dart';
import 'package:dsc_app/screens/member_screen/member_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  MemberModel member;

  MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MemberDetailScreen.tag, arguments: member.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Color(0xff005c7e).withOpacity(0.05),
                offset: Offset(0, 10),
                blurRadius: 5)
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: double.infinity,
                    imageUrl: member.avatarUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (_, error, url) => CachedNetworkImage(
                      imageUrl: DEFAULT_IMAGE_AVATAR,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
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
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,5,10,0),
                      child: FittedBox(
                        child: Text(
                          member.name,
                          style: TextStyle(
                              color: MAIN_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: MemberDepartmentChips(
                        department: member.department, isDetail: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
