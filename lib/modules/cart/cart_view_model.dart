import 'package:pos_van/modules/cart/cart_item_model.dart';
import 'package:pos_van/services/cart_services/cart_mock_service.dart';
import 'package:pos_van/services/cart_services/cart_service_interface.dart';

class CartViewModel {
  List<CartItemModel> itemsInCart = [];
  CartServiceInterface service = CartMockService();

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

  Future<void> onUserTappedSearchButton() async {}

  Future<void> onUserTappedCategoriesButton() async {}

  Future<void> onUserScannedBarcode({required String barcode}) async {}

  Future<void> onUserTappedCancelOrderButton() async {}

  Future<void> onUserTappedConfirmOrderButton() async {}
}
