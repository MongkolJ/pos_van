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

  Future<void> onUserTappedDecreaseAmount({required String sku}) async {}

  Future<void> onUserTappedIncreaseAmount({required String sku}) async {}

  Future<void> onUserSetItemAmount({
    required String sku,
    required int newAmount,
  }) async {}

  Future<void> onUserTappedDeleteButton({required String sku}) async {}

  Future<void> onUserTappedGiftPromotionButton({
    required String sku,
  }) async {}

  Future<void> onUserTappedDiscountPromotionButton({
    required String sku,
  }) async {}
}
