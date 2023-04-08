import 'package:collection/collection.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';
import 'package:pos_van/services/cart_services/cart_mock_service.dart';
import 'package:pos_van/services/cart_services/cart_service_interface.dart';

class CartViewModel {
  List<CartItemModel> itemsInCart = [];
  CartServiceInterface service = CartMockService();

  Future<bool> onUserTappedDecreaseAmount({required CartItemModel item}) async {
    bool adjustAmountResult = item.tryDecreaseAmount();
    return adjustAmountResult;
  }

  Future<bool> onUserTappedIncreaseAmount({required CartItemModel item}) async {
    bool adjustAmountResult = item.tryIncreaseAmount();
    return adjustAmountResult;
  }

  Future<void> onUserSetItemAmount({
    required CartItemModel item,
    required int newAmount,
  }) async {
    item.setAmount(amount: newAmount);
  }

  Future<void> onUserTappedDeleteButton({required CartItemModel item}) async {
    itemsInCart.remove(item);
  }

  Future<void> onUserTappedGiftPromotionButton({
    required String sku,
  }) async {}

  Future<void> onUserTappedDiscountPromotionButton({
    required String sku,
  }) async {}

  Future<void> onUserTappedSearchButton() async {}

  Future<void> onUserTappedCategoriesButton() async {}

  Future<void> onUserScannedBarcode({required String barcode}) async {
    CartItemModel? scannedItem = itemsInCart.firstWhereOrNull(
      (item) => item.barcode == barcode,
    );

    if (scannedItem != null) {
      scannedItem.tryIncreaseAmount();
      return;
    }

    try {
      scannedItem = await service.fetchItemByBarcode(barcode: barcode);
      itemsInCart.add(scannedItem);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> onUserTappedCancelOrderButton() async {}

  Future<void> onUserTappedConfirmOrderButton() async {}
}
