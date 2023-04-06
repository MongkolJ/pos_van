import 'package:flutter/material.dart';
import 'package:pos_van/components/circular_icon_button.dart';
import 'package:pos_van/constants/decorations/box_decorations.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ช้างเล็กยกลัง',
                    style: kTitleTextStyle,
                  ),
                ),
                _subSectionBuffer(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '8851993613102',
                    style: kSecondaryContentTextStyle,
                  ),
                ),
                _subSectionBuffer(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '729.00 บาท/ชิ้น',
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
                      onTapped: () async {},
                      fillColor: kFadedTextColor,
                      size: 40,
                    ),
                    CircularIconButton(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      onTapped: () async {},
                      fillColor: kPrimaryLightColor,
                      size: 40,
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
