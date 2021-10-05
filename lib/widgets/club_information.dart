import 'package:flutter/material.dart';

class ClubInformation extends StatelessWidget {
  const ClubInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Thông Tin',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text('Điện thoại'),
            subtitle: const Text('+84 378 283 131'),
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Email'),
            subtitle: const Text('hello@dsc-hust.club'),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin_circle),
            title: const Text('Địa chỉ'),
            subtitle: const Text('Đại học Bách Khoa Hà Nội'),
          ),
        ],
      ),
    );
  }
}
