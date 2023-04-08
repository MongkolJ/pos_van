import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:pos_van/modules/cart/cart_view_model.dart';
import 'package:pos_van/services/cart_services/cart_mock_service.dart';
import 'package:pos_van/services/cart_services/cart_service_interface.dart';

class CartTestService extends Fake implements CartMockService {}

@GenerateMocks([CartTestService])
void main() {
  late CartViewModel sut;
  late CartServiceInterface service;

  setUp(() {
    service = CartTestService();
    sut = CartViewModel();
    sut.service = service;
  });

  //TODO: Start testing here!.
}
