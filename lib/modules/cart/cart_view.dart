import 'package:flutter/material.dart';
import 'package:pos_van/components/circular_icon_button.dart';
import 'package:pos_van/constants/decorations/box_decorations.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';
import 'package:pos_van/modules/cart/components/cart_item_card.dart';

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
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            _sectionBuffer(),
            const Center(
              child: Text(
                'รายการขายเงินสด',
                style: kHeaderTextStyle,
              ),
            ),
            _sectionBuffer(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CartItemCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _sectionBuffer() {
    return const SizedBox(
      height: 8,
    );
  }
}
