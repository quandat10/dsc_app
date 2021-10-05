import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:dsc_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const tag = '/products';
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomedDrawer(),
      backgroundColor: BACK_GROUND_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: BACK_GROUND_COLOR,
        centerTitle: true,
        title: Text(TITLE_PRODUCTS,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
      ),
      body: Center(
        child: const Text('Không có sản phẩm hiển thị'),
      ),
    );
  }
}
