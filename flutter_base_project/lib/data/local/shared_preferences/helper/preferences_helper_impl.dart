import 'package:flutter_base_project/data/local/shared_preferences/helper/preferences_helper.dart';
import 'package:flutter_base_project/data/local/shared_preferences/preferences_service.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/domain/models/payment/credit_card.dart';
import 'package:flutter_base_project/domain/models/payment/payment.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

class PreferencesHelperImpl implements PreferencesHelper {
  final PreferencesService prefs;

  PreferencesHelperImpl({required this.prefs});

  @override
  Future<void> addCard({required CreditCard card}) async {}

  @override
  Future<void> addPayment() async {}

  @override
  Future<void> addProduct({required Product product}) async {}

  @override
  Future<void> createCart({required Cart cart}) async {}

  @override
  Future<void> deleteCard({required CreditCard card}) async {}

  @override
  Future<void> deleteCart() async {}

  @override
  Future<void> deletePayment() async {}

  @override
  Future<void> deleteProduct({required Product product}) async {}

  @override
  Future<List<CreditCard>> getCards() async {
    return [];
  }

  @override
  Future<Cart> getCart() async {
    return Cart(
      id: 0,
      products: [],
      payment: Payment(
          card: CreditCard(
            id: 0,
            number: "",
            date: "",
            securityNumber: "",
          ),
          times: 0,
          totalValue: 0.0),
    );
  }

  @override
  Future<Cart> updateCart({required Cart cart}) async {
    return Cart(
      id: 0,
      products: [],
      payment: Payment(
          card: CreditCard(
            id: 0,
            number: "",
            date: "",
            securityNumber: "",
          ),
          times: 0,
          totalValue: 0.0),
    );
  }
}
