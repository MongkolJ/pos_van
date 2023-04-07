import 'package:pos_van/modules/cart/cart_item_model.dart';

class CartViewModel {
  List<CartItemModel> items = [
    CartItemModel(
      sku: 'sku',
      barcode: '8851993613102',
      title: 'ช้างเล็กยกลัง',
      price: 729,
      amount: 1,
      remainInStock: 10,
    ),
    CartItemModel(
      sku: 'sku',
      barcode: '8851993613102',
      title: 'ช้างเล็กยกลัง',
      price: 729,
      amount: 1,
      remainInStock: 10,
    ),
    CartItemModel(
      sku: 'sku',
      barcode: '8851993613102',
      title: 'ช้างเล็กยกลัง',
      price: 729,
      amount: 1,
      remainInStock: 10,
    ),
  ];

  Future<void> onUserTappedDecreaseAmount({required CartItemModel item}) async {
    bool adjustAmountResult = item.tryDecreaseAmount();
    if (!adjustAmountResult) {
      return;
    }
  }

  Future<void> onUserTappedIncreaseAmount({required CartItemModel item}) async {
    bool adjustAmountResult = item.tryIncreaseAmount();
    if (!adjustAmountResult) {
      return;
    }
  }

  Future<void> onUserSetItemAmount({
    required CartItemModel item,
    required int newAmount,
  }) async {
    item.setAmount(amount: newAmount);
  }

  Future<void> onUserTappedDeleteButton({required CartItemModel item}) async {}

  Future<void> onUserTappedGiftPromotionButton({
    required String sku,
  }) async {}

  Future<void> onUserTappedDiscountPromotionButton({
    required String sku,
  }) async {}
}
