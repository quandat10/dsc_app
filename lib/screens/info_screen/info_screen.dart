import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Html(
                data: '''<html><head></head><body><section class="about-page">
    <div class="about-row">
        <div class="about-content">
            <h2>
                Giới thiệu về <br> <span style="color: rgb(243, 115, 53)">GDSC</span>
            </h2>
            <p>
                🎓 <strong>Google Developer Student Clubs</strong> là một cộng đồng dành cho sinh
                viên các trường Đại học có niềm đam mê với công nghệ, muốn
                tiếp cận những sự đổi mới công nghệ trên toàn thế giới.
            </p>
            <p>
                💁‍♂️ Được hỗ trợ bởi <strong>Google</strong> với mục tiêu xây dựng câu lạc bộ tại các
                trường Đại học, và tìm ra giải pháp cho các vấn đề cộng đồng.
            </p>
        </div>
    </div>
    <div class="about-row">
        <div class="about-content">
            <h2>Sứ mệnh <br> <span style="color: rgb(243, 115, 53)">GDSC</span></h2>
            <p>
                <strong>Google Developer Student Clubs</strong> Là cầu nối giúp sinh viên thu hẹp
                khoảng cách giữa Lý thuyết và Thực tiễn.
            </p>
            <ul>
                <li>
                    Sinh Viên: Nâng cao kiến thức, kĩ năng và mở rộng tầm
                    nhìn về công nghệ
                </li>
                <li>
                    Cộng Đồng: Sinh viên sử dụng các kỹ năng được hỗ trợ mạnh
                    mẽ từ Google để giải quyết các vấn đề về mà doanh nghiệp,
                    địa phương đang gặp phải
                </li>
            </ul>
        </div>
    </div>
    <div class="about-row">
        <div class="about-content">
            <h2>Lợi ích</h2>
            <ul>
                <li>👩‍💻 Làm việc trong môi trường <strong>chuyên nghiệp</strong></li>
                <li>
                    🤝 Mở rộng <strong>kết nối</strong>, làm việc cùng với cộng động và các chuyên
                    gia của Google (GDG, GDE,...)
                </li>
                <li>
                    ⚙️ Tìm hiểu các hoạt động về chủ đề <strong>kỹ thuật</strong> (Web, App, AI/ML,
                    Cloud) thông qua hội thảo, workshop và hoạt động xây dựng dự án
                </li>
                <li>
                    ✅ Áp dụng những kiến thức và kết nối mới của bạn để <strong>xây dựng
                    các giải pháp</strong> tuyệt vời cho các vấn đề doanh nghiệp.
                </li>
                <li>
                    👨‍💼 Nâng cao <strong>kỹ năng công nghệ</strong>: Code, giải quyết vấn đề, quản
                    lý dự án,...
                </li>
                <li>
                    🎨 Nâng cao <strong>kỹ năng mềm</strong>: làm việc nhóm, giao tiếp, tư duy thiết
                    kế,...
                </li>
            </ul>
        </div>
    </div>
</section></body></html>''')));
  }
}
