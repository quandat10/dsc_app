import 'package:dsc_app/apis/members_api.dart';
import 'package:dsc_app/models/member/member_model.dart';
import 'package:dsc_app/screens/member_screen/extended_member_screen.dart';
import 'package:dsc_app/screens/member_screen/widgets/member_card.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  Widget _textHeaderItem(String title, void Function() function) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
              color: SECONDARY_COLOR,
            ),
          ),
          InkWell(
            onTap: function,
            highlightColor: PRIMARY_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: const Text(
                      'Xem thêm',
                      style: TextStyle(fontSize: 12, color: PRIMARY_COLOR),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 8,
                    color: PRIMARY_COLOR,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: MembersApi().getGenNumber(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            int numberOfGens = snapshot.data as int;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: const Text(
                      'Thành viên',
                      style: TextStyle(
                          fontSize: 36,
                          color: ERROR_COLOR,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1),
                    ),
                  ),
                  for (int i = 0; i < numberOfGens + 1; i++)
                    FutureBuilder(
                      future: MembersApi().getMembersGen(gen: i),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          List<MemberModel> members =
                              snapshot.data as List<MemberModel>;
                          return Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: _textHeaderItem(
                                      'Gen ${members[0].generation}', () {
                                    Navigator.of(context).pushNamed(
                                        ExtendedMemberScreen.tag,
                                        arguments: members);
                                  })),
                              const SizedBox(height: 15),
                              AnimationLimiter(
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(16),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.7),
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                  ),
                                  itemBuilder: (_, index) =>
                                      AnimationConfiguration.staggeredGrid(
                                          duration:
                                              const Duration(milliseconds: 375),
                                          position: index,
                                          columnCount: 2,
                                          child: ScaleAnimation(
                                            child: FadeInAnimation(
                                              child: MemberCard(
                                                  member: members[index]),
                                            ),
                                          )),
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
                    )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
