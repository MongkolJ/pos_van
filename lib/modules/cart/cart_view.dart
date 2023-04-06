import 'package:flutter/material.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CartItemCard(
                        model: CartItemModel(
                          sku: 'sku',
                          barcode: '8851993613102',
                          title: 'ช้างเล็กยกลัง',
                          price: 729,
                          amount: 1,
                          remainInStock: 10,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
