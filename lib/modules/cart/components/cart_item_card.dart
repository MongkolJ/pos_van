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
  }) : super(key: key);

  final CartItemModel model;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.model.amount.toStringAsFixed(0);
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
                      onTapped: () async {
                        bool adjustAmountResult = widget.model.decreaseAmount();
                        if (!adjustAmountResult) {
                          return;
                        }

                        _amountController.text =
                            widget.model.amount.toStringAsFixed(0);
                      },
                      fillColor: kFadedTextColor,
                      size: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: BorderedTextField(
                          controller: _amountController,
                          onEditingEnd: () async {
                            int? newAmount =
                                int.tryParse(_amountController.text);
                            if (newAmount == null) {
                              setState(() {
                                _amountController.clear();
                              });
                              return;
                            }

                            widget.model.setAmount(amount: newAmount);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    CircularIconButton(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      onTapped: () async {
                        bool adjustAmountResult = widget.model.increaseAmount();
                        if (!adjustAmountResult) {
                          return;
                        }

                        _amountController.text =
                            widget.model.amount.toStringAsFixed(0);
                      },
                      fillColor: kPrimaryLightColor,
                      size: 40,
                    ),
                  ],
                ),
                _subSectionBuffer(),
                Text(
                  'เหลือ: ${widget.model.amount} ชิ้น',
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
                      onTap: () async {},
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
