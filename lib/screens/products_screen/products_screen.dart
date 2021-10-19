import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const tag = '/products';
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: const Text('Không có sản phẩm hiển thị'),
      ),
    );
  }
}
