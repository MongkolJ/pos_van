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
            const Center(
              child: Text(
                'รายการขายเงินสด',
                style: kHeaderTextStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
}
