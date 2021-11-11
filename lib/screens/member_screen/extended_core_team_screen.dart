import 'package:dsc_app/apis/members_api.dart';
import 'package:dsc_app/models/member/member_model.dart';
import 'package:dsc_app/screens/member_screen/widgets/member_card.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ExtendedCoreTeamScreen extends StatefulWidget {
  static const tag = '/extended-core-team';

  const ExtendedCoreTeamScreen({Key? key}) : super(key: key);

  @override
  State<ExtendedCoreTeamScreen> createState() => _ExtendedCoreTeamScreenState();
}

class _ExtendedCoreTeamScreenState extends State<ExtendedCoreTeamScreen> {
  PagingController<int, MemberModel> _pagingController =
      PagingController(firstPageKey: 0);
  bool firstLoad = true;

  didChangeDependencies() {
    if (firstLoad) {
      _pagingController.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
    }
    firstLoad = false;
    super.didChangeDependencies();
  }

  dispose(){
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await MembersApi().getCoreTeamMember(pageKey: pageKey);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
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
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
              ),
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
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.72),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Core Team',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.48,
                    color: SECONDARY_COLOR,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              PagedGridView<int, MemberModel>(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                pagingController: _pagingController,
                showNewPageProgressIndicatorAsGridChild: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                builderDelegate: PagedChildBuilderDelegate<MemberModel>(
                  newPageProgressIndicatorBuilder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  itemBuilder: (context, item, index) =>
                      AnimationConfiguration.staggeredGrid(
                    duration: const Duration(milliseconds: 500),
                    position: index,
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                          child: MemberCard(
                        member: item,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
