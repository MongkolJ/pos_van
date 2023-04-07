class CartItemModel {
  late String sku;
  late String barcode;
  late String title;
  late double price;
  late int amount;
  late int remainInStock;
  Promotion? promotion;

  CartItemModel({
    required this.sku,
    required this.barcode,
    required this.title,
    required this.price,
    required this.amount,
    required this.remainInStock,
    this.promotion,
  });

  CartItemModel.fromJson({required Map<String, dynamic> map}) {
    sku = map['sku'];
    barcode = map['barcode'];
    title = map['title'];
    price = map['price'];
    amount = 1;
    remainInStock = map['remainInStock'];
  }

  String totalPrice() {
    return (amount * price).toString();
  }

  bool tryIncreaseAmount() {
    if (amount < remainInStock) {
      amount++;
      return true;
    }

    return false;
  }

  bool tryDecreaseAmount() {
    if (amount > 1) {
      amount--;
      return true;
    }
    return false;
  }

  void setAmount({required int amount}) {
    this.amount = amount;
  }
}

class Promotion {}
