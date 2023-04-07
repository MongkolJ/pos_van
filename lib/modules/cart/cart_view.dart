import 'package:flutter/material.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';
import 'package:pos_van/modules/cart/cart_view_model.dart';
import 'package:pos_van/modules/cart/components/cart_item_card.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartViewModel _viewModel = CartViewModel();

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
                  itemCount: _viewModel.items.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    CartItemModel item = _viewModel.items[index];
                    TextEditingController controller =
                        TextEditingController(text: item.amount.toString());
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CartItemCard(
                        model: item,
                        amountController: controller,
                        onUserTappedDeleteButton: () async {
                          await _viewModel.onUserTappedDeleteButton(
                            item: item,
                          );
                          controller.text = item.amount.toString();
                          setState(() {});
                        },
                        onUserTappedIncreaseButton: () async {
                          await _viewModel.onUserTappedIncreaseAmount(
                            item: item,
                          );
                          controller.text = item.amount.toString();
                          setState(() {});
                        },
                        onUserTappedDecreaseButton: () async {
                          await _viewModel.onUserTappedDecreaseAmount(
                            item: item,
                          );
                          controller.text = item.amount.toString();
                          setState(() {});
                        },
                        onUserSetAmount: () async {
                          int? newAmount = int.tryParse(controller.text);
                          if (newAmount == null) {
                            setState(() {
                              controller.clear();
                            });
                            return;
                          }

                          _viewModel.onUserSetItemAmount(
                            item: item,
                            newAmount: newAmount,
                          );
                          setState(() {});
                        },
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
