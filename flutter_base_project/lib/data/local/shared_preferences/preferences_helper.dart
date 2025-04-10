import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/domain/models/payment/credit_card.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

abstract interface class PreferencesHelper {
  // User
  Future<void> saveUserToken({required String token});
  Future<String?> getUserToken();
  Future<void> saveThemeMode({required bool isDarkMode});
  Future<bool> getThemeMode();

  // Cart
  Future<Cart?> getCart();
  Future<void> deleteCart();
  Future<Cart> updateCart({required Cart cart});

  // Payment
  Future<void> addPayment();
  Future<void> deletePayment();

  // Cards
  Future<List<CreditCard>> getCards();
  Future<void> addCard({required CreditCard card});
  Future<void> deleteCard({required CreditCard card});
}