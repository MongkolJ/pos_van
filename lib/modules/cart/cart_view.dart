import 'package:flutter/material.dart';
import 'package:pos_van/constants/colors.dart';
import 'package:pos_van/constants/text_styles.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Center(
              child: Text(
                'รายการขายเงินสด',
                style: kHeaderTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
