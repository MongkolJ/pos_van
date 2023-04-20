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

  test('Request total price', () {
    int amount = sut.amount;
    double price = sut.price;
    expect(sut.totalPrice(), (amount * price).toString());
  });

  group('Adjust amount', () {
    test('Increase amount', () {
      int amountSnapshot = sut.amount;
      sut.tryIncreaseAmount();
      expect(sut.amount, amountSnapshot + 1);
    });

    test('Increase amount where current amount is equal to remainInStock', () {
      sut.amount = sut.remainInStock;
      int amountSnapshot = sut.amount;
      sut.tryIncreaseAmount();
      expect(sut.amount, amountSnapshot);
    });

    test('Decrease amount', () {
      sut.tryIncreaseAmount();
      int amountSnapshot = sut.amount;
      sut.tryDecreaseAmount();
      expect(sut.amount, amountSnapshot - 1);
    });

    test('Decrease amount where current amount is equal to 1', () {
      int amountSnapshot = sut.amount;
      bool result = sut.tryDecreaseAmount();
      expect(result, false);
      expect(sut.amount, amountSnapshot);
    });

    test('Set amount', () {
      int neededAmount = 10;
      expect(sut.amount, 1);
      sut.setAmount(amount: neededAmount);
      expect(sut.amount, neededAmount);
    });

    test('Set amount to negative quantity', () {});

    test('Set amount exceed remainInStock', () {});
  });
}
