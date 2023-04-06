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
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SKU Title',
                    style: kTitleTextStyle,
                  ),
                ),
                _subSectionBuffer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'barcode',
                    style: kSecondaryContentTextStyle,
                  ),
                ),
                _subSectionBuffer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Price',
                    style: kHighLightBodyTextStyle,
                  ),
                ),
                _subSectionBuffer(height: 12),
                SizedBox(
                  height: 36,
                  child: Row(
                    children: [
                      CircularIconButton(
                        icon: Icons.card_giftcard,
                        colorTheme: kPrimaryLightColor,
                        onTapped: () async {},
                      ),
                      CircularIconButton(
                        icon: Icons.percent,
                        colorTheme: kPrimaryLightColor,
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
              children: [],
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
