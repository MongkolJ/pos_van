import 'package:flutter_test/flutter_test.dart';
import 'package:pos_van/modules/cart/cart_item_model.dart';

void main() {
  late CartItemModel sut;

  setUp(() {
    sut = CartItemModel(
      sku: '142135',
      barcode: '123',
      title: '123',
      price: 15,
      amount: 1,
      remainInStock: 35,
    );
  });

  test('Create a new model from JSON', () {});

  test('Request total price', () {});

  group('Adjust amount', () {
    test('Increase amount', () {});
    test('Increase amount where current amount is equal to remainInStock',
        () {});
    test('Decrease amount', () {});
    test('Decrease amount where current amount is equal to 1', () {});

    test('Set amount', () {});
    test('Set amount to negative quantity', () {});
    test('Set amount exceed remainInStock', () {});
  });
}
