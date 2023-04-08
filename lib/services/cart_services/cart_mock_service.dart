import 'package:pos_van/exceptions/service_exceptions.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';
import 'package:pos_van/services/cart_services/cart_service_interface.dart';

class CartMockService implements CartServiceInterface {
  @override
  Future<CartItemModel> fetchItemByBarcode({required String barcode}) async {
    RegExp numeric = RegExp(r'\d');
    if (!numeric.hasMatch(barcode)) {
      throw InvalidInputError(message: 'Invalid barcode format', errorCode: 0);
    }

    return CartItemModel(
      sku: barcode,
      barcode: barcode,
      title: barcode,
      price: double.parse(barcode),
      amount: 1,
      remainInStock: int.parse(barcode) * 2,
    );
  }

  @override
  Future<List<CartItemModel>> fetchItemsByKeyword(
      {required String keyword}) async {
    // TODO: implement fetchItemsByKeyword
    throw UnimplementedError();
  }
}
