import 'package:pos_van/modules/cart/cart_item_model.dart';

abstract class CartServiceInterface {
  Future<CartItemModel> fetchItemByBarcode({required String barcode});

  Future<List<CartItemModel>> fetchItemsByKeyword({required String keyword});
}
