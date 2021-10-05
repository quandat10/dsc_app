import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:dsc_app/widgets/club_information.dart';
import 'package:dsc_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  static const tag = '/contact';

  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomedDrawer(),
      backgroundColor: BACK_GROUND_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: BACK_GROUND_COLOR,
        centerTitle: true,
        title: Text(TITLE_CONTACT,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Đóng góp ý kiến',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Form(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                decoration:
                                    const InputDecoration(labelText: 'Tên'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                              ),
                            )
                          ],
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Tin nhắn'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClubInformation(),
        ]),
      ),
    );
  }
}
