import 'package:flutter_test/flutter_test.dart';
import 'package:pos_van/exceptions/service_exceptions.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';
import 'package:pos_van/modules/cart/cart_view_model.dart';
import 'package:pos_van/services/cart_services/cart_mock_service.dart';
import 'package:pos_van/services/cart_services/cart_service_interface.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:math';

class CartTestService extends Mock implements CartMockService {}

void main() {
  late CartViewModel sut;
  late CartServiceInterface service;

  setUp(() {
    service = CartTestService();
    sut = CartViewModel();
    sut.service = service;
  });

  void arrangeMockServiceReturnItems({required String keyword}) {
    String generateRandomString(int len) {
      var r = Random();
      return String.fromCharCodes(
          List.generate(len, (index) => r.nextInt(33) + 89));
    }

    when(() => service.fetchItemByBarcode(barcode: keyword)).thenAnswer(
      (_) async => Future.value(
        CartItemModel(
          sku: keyword,
          barcode: keyword,
          title: generateRandomString(10),
          price: double.parse(keyword),
          amount: 1,
          remainInStock: int.parse(keyword) * 2,
        ),
      ),
    );

    when(() => service.fetchItemsByKeyword(keyword: keyword))
        .thenAnswer((invocation) async {
      return [
        CartItemModel(
          sku: generateRandomString(10),
          barcode: generateRandomString(10),
          title: generateRandomString(10),
          price: double.parse(keyword),
          amount: 12,
          remainInStock: int.parse(keyword) * 4,
        )
      ];
    });
  }

  group('Service work properly', () {
    test('Fetch Item with corrected barcode', () async {
      String barcode = '123';
      arrangeMockServiceReturnItems(keyword: barcode);
      expect((await service.fetchItemByBarcode(barcode: barcode)).barcode,
          barcode);
    });

    test('Fetch Item with invalid barcode', () async {
      String barcode = '123';
      when(() => service.fetchItemByBarcode(barcode: barcode)).thenThrow(
        InvalidInputError(message: '123', errorCode: 1),
      );

      expect(() async => await service.fetchItemByBarcode(barcode: barcode),
          throwsA(isA<InvalidInputError>()));
    });
  });

  group('Add Item', () {
    test('On User Scanned Barcode with new item', () async {
      String barcode = '123';
      arrangeMockServiceReturnItems(keyword: barcode);
      expect(sut.itemsInCart.isEmpty, true);
      await sut.onUserScannedBarcode(barcode: barcode);
      expect(sut.itemsInCart.length, 1);
      expect(sut.itemsInCart.last.barcode, '123');
    });

    test('On User Scanned Barcode with existed item', () async {
      String barcode = '123';
      arrangeMockServiceReturnItems(keyword: barcode);
      expect(sut.itemsInCart.isEmpty, true);
      sut.itemsInCart.add(CartItemModel(
        sku: barcode,
        barcode: barcode,
        title: barcode,
        price: double.parse(barcode),
        amount: 1,
        remainInStock: int.parse(barcode) * 2,
      ));
      await sut.onUserScannedBarcode(barcode: barcode);
      expect(sut.itemsInCart.length, 1);
      expect(sut.itemsInCart.last.barcode, '123');
      expect(sut.itemsInCart.last.amount, 2);
    });

    test('On User Scanned Barcode with non exist barcode', () async {
      String barcode = '123523477658536';

      when(() => service.fetchItemByBarcode(barcode: barcode))
          .thenThrow(Exception());

      expect(sut.itemsInCart.isEmpty, true);
      expect(() async => (await sut.onUserScannedBarcode(barcode: barcode)),
          throwsException);
    });
  });
}
