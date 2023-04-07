import 'package:flutter/material.dart';
import 'package:pos_van/components/bordered_text_field.dart';
import 'package:pos_van/components/circular_icon_button.dart';
import 'package:pos_van/constants/decorations/box_decorations.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key? key,
    required this.model,
    required this.amountController,
    required this.onUserTappedDeleteButton,
    required this.onUserTappedIncreaseButton,
    required this.onUserTappedDecreaseButton,
    required this.onUserSetAmount,
  }) : super(key: key);

  final CartItemModel model;
  final Future<void> Function() onUserTappedDeleteButton;
  final Future<void> Function() onUserTappedIncreaseButton;
  final Future<void> Function() onUserTappedDecreaseButton;
  final Future<void> Function() onUserSetAmount;
  final TextEditingController amountController;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kCardDecoration,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.model.title,
                    style: kTitleTextStyle,
                  ),
                ),
                _subSectionBuffer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.model.barcode,
                    style: kSecondaryContentTextStyle,
                  ),
                ),
                _subSectionBuffer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.model.price} บาท/ชิ้น',
                    style: kHighLightBodyTextStyle,
                  ),
                ),
                _subSectionBuffer(height: 8),
                SizedBox(
                  height: 36,
                  child: Row(
                    children: [
                      CircularIconButton(
                        icon: Icons.card_giftcard,
                        iconColor: kPrimaryLightColor,
                        onTapped: () async {},
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      CircularIconButton(
                        icon: Icons.percent,
                        iconColor: kPrimaryLightColor,
                        onTapped: () async {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularIconButton(
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      onTapped: widget.onUserTappedDecreaseButton,
                      fillColor: kFadedTextColor,
                      size: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: BorderedTextField(
                          controller: widget.amountController,
                          onEditingEnd: widget.onUserSetAmount,
                        ),
                      ),
                    ),
                    CircularIconButton(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      onTapped: widget.onUserTappedIncreaseButton,
                      fillColor: kPrimaryLightColor,
                      size: 40,
                    ),
                  ],
                ),
                _subSectionBuffer(),
                Text(
                  'เหลือ: ${widget.model.remainInStock} ชิ้น',
                  style: kRedIndicatorTextStyle,
                ),
                _subSectionBuffer(),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'รวม ${widget.model.totalPrice()} บาท',
                      style: kSubHeaderTextStyle,
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: widget.onUserTappedDeleteButton,
                      child: const Icon(
                        Icons.delete_outline,
                        color: kRedTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _subSectionBuffer({double height = 4}) {
    return SizedBox(
      height: height,
    );
  }
}
