import 'package:flutter/cupertino.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final String dateTime;
  final String location;
  final List<String> organizations;
  final List<String> images;
  final bool isEvent;
  final bool isRecruitment;

  Post(
      {required this.isEvent,
      required this.isRecruitment,
      required this.location,
      required this.organizations,
      required this.id,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.images});
}

List<String> _images = [
  'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/168778898_422104385808221_5273925284109226949_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=340051&_nc_ohc=5ZdxnXfeS6oAX-POWt5&_nc_ht=scontent.fhan3-3.fna&oh=1cc90b04ba055f9db0365ef9f7eff90a&oe=6180B76E',
  'https://scontent.fhan3-1.fna.fbcdn.net/v/t1.6435-9/p180x540/170186683_424109722274354_2964945143343675288_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=a610ef&_nc_ohc=bmygKzU_xX0AX8jgsVk&_nc_ht=scontent.fhan3-1.fna&oh=3fd5ce711509683fdc96f1cfca075a31&oe=61828A98',
  'https://scontent.fhan3-2.fna.fbcdn.net/v/t1.6435-9/s851x315/169071127_422034009148592_8402771654653566616_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=44856e&_nc_ohc=YyB4tUo0A-EAX9Ak7hl&_nc_ht=scontent.fhan3-2.fna&oh=025a3159ab74f3d78f7cff9f3901703c&oe=617FBE85',
  'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/167194653_422034029148590_7758508564405031837_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=44856e&_nc_ohc=WAcapxjWunAAX9-4XS6&_nc_ht=scontent.fhan3-3.fna&oh=b734144dc0210dbed45697bb6aa7beab&oe=6181FAEC',
  'https://scontent.fhan4-2.fna.fbcdn.net/v/t1.6435-9/168616784_422034129148580_9192798565161647413_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=44856e&_nc_ohc=8f_MjE5Bmo0AX_G0QQ1&tn=n8vGUnKVKrW70BN0&_nc_ht=scontent.fhan4-2.fna&oh=2b5b563be92956cf4b4b4a78892589e1&oe=6180878E'
];

final List<Post> _posts = [
  Post(
    isEvent: true,
    isRecruitment: false,
    location: 'Ngõ 7 Phố Tôn Thất Thuyết, Hà Nội, Việt Nam',
    organizations: [
      'Google Developer Student Clubs - Hanoi University of Science and Technology',
      'GDG Vietnam Webinar'
    ],
    id: 'm1',
    title: 'WORKSHOP MACHINE LEARNING AND AI',
    dateTime: 'SATURDAY, APRIL 10, 2021 AT 9 AM – 4 PM',
    images: _images,
    description:
        """Lĩnh vực Học máy và trí tuệ nhân tạo đang phát triển mạnh mẽ và tạo ra nhiều cơ hội cho ngành công nghệ thông tin, đặc biệt đối với các nước đang phát triển như Việt Nam. Vậy, các bạn trẻ đam mê lĩnh vực này hoặc đơn giản muốn dấn thân thử thách những điều mới, bạn đã có kế hoạch gì cho mình trên hành trình này chưa?
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
      """,
  )
];

class Events with ChangeNotifier {
  final List<Post> _events =
      _posts.where((element) => element.isEvent == true).toList();

  List<Post> get events {
    return [..._events];
  }
}

class News with ChangeNotifier {
  final List<Post> _news = _posts;

  List<Post> get news {
    return [..._news];
  }
}
