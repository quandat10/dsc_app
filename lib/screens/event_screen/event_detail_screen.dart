import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/event_background_item.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  Widget _descriptionItem(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFEABDE8).withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: PRIMARY_COLOR,
            size: 23,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF747688)),
            )
          ],
        )
      ],
    );
  }

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
        body: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                'SỰ KIỆN',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                    color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MyFlutterApp.mark,
                    size: 24,
                  ),
                ),
              ],
              expandedHeight: 210,
              flexibleSpace: FlexibleSpaceBar(
                background: EventBackgroundItem(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Workshop: Học máy và Trí tuệ nhân tạo',
                      style: TextStyle(
                          color: ERROR_COLOR,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _descriptionItem(
                        title: 'Thứ ba, 12/12/2021',
                        subtitle: 'Sáng, 7 giờ 00',
                        icon: FontAwesomeIcons.calendar),
                    const SizedBox(
                      height: 10,
                    ),
                    _descriptionItem(
                        title: 'National Innovation Center',
                        subtitle: '6 Hoàng Diệu, Quán Thánh, Ba Đình, Hà Nội',
                        icon: Icons.add_location),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Thông tin sự kiện:',
                      style: TextStyle(
                        color: ERROR_COLOR,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _eventInfoItem(
                        'Đơn vị tổ chức: ', 'GDG Hanoi, DSC - HUST, NICS'),
                    const SizedBox(
                      height: 10,
                    ),
                    _eventInfoItem('Khách mời/Diễn giả: ',
                        'Ba Ngoc, Thanh Ngan, GDG Hanoi'),
                    const SizedBox(
                      height: 10,
                    ),
                    _eventInfoItem('Mô tả: ', '''
Lĩnh vực Học máy và trí tuệ nhân tạo đang phát triển mạnh mẽ và tạo ra nhiều cơ hội cho ngành công nghệ thông tin, đặc biệt đối với các nước đang phát triển như Việt Nam. Vậy, các bạn trẻ đam mê lĩnh vực này hoặc đơn giản muốn dấn thân thử thách những điều mới, bạn đã có kế hoạch gì cho mình trên hành trình này chưa?
❓Nếu bạn là:
✨ Sinh viên năng động, nhiệt huyết và sẵn sàng dấn thân vào mọi thử thách
✨ Sinh viên năm 3, năm 4 đang đứng trước những khó khăn cho kỳ thực tập giữa khóa hay sự nghiệp lâu dài
✨ Có khả năng sáng tạo, học hỏi, cầu tiến và tinh thần trách nhiệm cao.
➤ Đừng bỏ qua cơ hội tham gia cuộc hành trình lần này do TensorFlow User Group Vietnam , GDG Hà Nội và Google Developer Student Clubs HUST với sự hợp tác cùng Trung Tâm Đổi Mới Sáng Tạo Quốc gia tổ chức. Tất cả những thắc mắc sẽ được giải đáp trong chuyến tàu DSC HUST- 1004 với chủ đề: 𝐌𝐀𝐂𝐇𝐈𝐍𝐄 𝐋𝐄𝐀𝐑𝐍𝐈𝐍𝐆 𝐀𝐍𝐃 𝐀𝐈
💌 Link đăng ký: https://forms.gle/65Jd3JPHHcQadL3h7
🔥 Tham gia hành trình, bạn sẽ nhận được:
🤟 Cơ hội để có một cái nhìn rõ nét về bước đầu cho ngành Học Máy và Trí Tuệ Nhân Tạo.
🤟Được huấn luyện bởi 3 Google Developer Expert mảng Học Máy và nhận chứng nhận tham gia và các phần quà khác.
🤟Được lắng nghe những chia sẻ vô cùng thực tế từ đội ngũ những người có chuyên môn cao trong lĩnh vực Học máy và AI.
🎁 Ngoài ra còn có thêm nhiều phần quà hấp dẫn và một bất ngờ nho nhỏ dành cho những bạn tham gia workshop nữa đó!
⭕️Thông tin về buổi workshop:
⏱ Timeline sự kiện: 9am - 4pm, ngày 10/4/2021
- 8h45 - 9h30: Check-in sự kiện.
- 9h30 - 10h00: Giới thiệu về Học máy, Trí tuệ Nhân tạo và các tài nguyên liên quan.
- 10h00 - 12h00: Workshop: Căn bản về Học Máy và Trí Tuệ Nhân Tạo.
- 12h - 13h30: Nghỉ trưa.
- 13h30 - 15h30: Các bạn chọn 1 trong 2 workshop dưới đây để tham gia:
+ Demo Question Answering
+ Demo Image Captioning
- 15h30 - 16h00: Chia tay, trao quà và certificate
🔻 Địa điểm: Trung tâm Đổi mới sáng tạo Quốc gia - NIC, Bộ Kế hoạch và Đầu tư, ngõ 7 Tôn Thất Thuyết, Cầu Giấy, Hà Nội.
🥰 Hẹn gặp tất cả các bạn tại buổi workshop!
---------------------------------------------------
Mọi thông tin chi tiết vui lòng liên hệ:
➤ Hotline: 0378283131
➤ Email: dsc.hust.2020@gmail.com hoặc hello@dsc-hust.club
➤ Website : dsc-hust.club
➤ Page: Developer Student Club - HUST's Students
                    '''),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          'Xem thêm',
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: GRADIENT_01),
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
