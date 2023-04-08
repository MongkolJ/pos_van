import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:pos_van/constants/decorations/colors.dart';
import 'package:pos_van/constants/decorations/text_styles.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';
import 'package:pos_van/modules/cart/cart_view_model.dart';
import 'package:pos_van/modules/cart/components/cart_item_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late bool _visible;

  final CartViewModel _viewModel = CartViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: VisibilityDetector(
          key: const Key('cart-view-barcode-listener'),
          onVisibilityChanged: (VisibilityInfo info) {
            _visible = info.visibleFraction > 0;
          },
          child: BarcodeKeyboardListener(
            onBarcodeScanned: (String barcode) async {
              if (!_visible) return;

              try {
                await _viewModel.onUserScannedBarcode(barcode: barcode);
                setState(() {});
              } catch (_) {
                //TODO: Show error dialog here.
              }
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: _body(),
            ),
          ),
        ),
      ),
    );
  }

  Column _body() {
    return Column(
      children: [
        _sectionBuffer(),
        const Center(
          child: Text(
            'รายการขายเงินสด',
            style: kHeaderTextStyle,
          ),
        ),
        _sectionBuffer(),
        _itemsList(),
      ],
    );
  }

  Expanded _itemsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _viewModel.itemsInCart.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          CartItemModel item = _viewModel.itemsInCart[index];
          TextEditingController controller =
              TextEditingController(text: item.amount.toString());
          return _itemCard(item, controller);
        },
      ),
    );
  }

  Padding _itemCard(CartItemModel item, TextEditingController controller) {
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
          bool isIncreaseSuccess = await _viewModel.onUserTappedIncreaseAmount(
            item: item,
          );

          if (isIncreaseSuccess) {
            controller.text = item.amount.toString();
            setState(() {});
            return;
          }

          //TODO: show error dialog here!.

        },
        onUserTappedDecreaseButton: () async {
          bool isDecreaseSuccess = await _viewModel.onUserTappedDecreaseAmount(
            item: item,
          );
          if (isDecreaseSuccess) {
            controller.text = item.amount.toString();
            setState(() {});
            return;
          }

          //TODO: show error dialog here!.

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
  }

  SizedBox _sectionBuffer() {
    return const SizedBox(
      height: 8,
    );
  }
}
