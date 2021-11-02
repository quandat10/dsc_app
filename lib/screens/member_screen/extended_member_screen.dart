import 'package:dsc_app/models/member/member_model.dart';
import 'package:dsc_app/screens/member_screen/widgets/member_card.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExtendedMemberScreen extends StatelessWidget {
  static const tag = '/extended-member';

  const ExtendedMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var members =
        ModalRoute.of(context)!.settings.arguments as List<MemberModel>;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background_image.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Google Developer Student Clubs',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Hanoi University of Science and Technology',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.bell),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: const Text(
                  'Thành viên',
                  style: TextStyle(
                      fontSize: 36,
                      color: ERROR_COLOR,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Gen ${members[0].generation}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                    color: SECONDARY_COLOR,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AnimationLimiter(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: members.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.7),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (_, index) =>
                      AnimationConfiguration.staggeredGrid(
                          duration: const Duration(milliseconds: 375),
                          position: index,
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: MemberCard(member: members[index]),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
