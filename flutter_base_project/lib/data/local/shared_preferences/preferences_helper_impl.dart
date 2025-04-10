import 'dart:convert';

import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/domain/models/payment/credit_card.dart';
import 'package:flutter_base_project/domain/models/payment/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelperImpl implements PreferencesHelper {
  late final SharedPreferences prefs;

  PreferencesHelperImpl._(this.prefs);

  static Future<PreferencesHelperImpl> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesHelperImpl._(prefs);
  }

  // Constants
  final _userTokenKey = "Preferences.userTokenKey";
  final _themeModeKey = "Preferences.themeModeKey";
  final _cartKey = "Preferences.cartKey";

  @override
  Future<void> saveUserToken({required String token}) async =>
      await _setString(key: _userTokenKey, value: token);

  @override
  Future<String?> getUserToken() async => await _getString(key: _userTokenKey);

  @override
  Future<void> saveThemeMode({required bool isDarkMode}) async =>
      await _setBool(key: _themeModeKey, value: isDarkMode);

  @override
  Future<bool> getThemeMode() async =>
      await _getBool(key: _themeModeKey) ?? false;

  @override
  Future<void> addCard({required CreditCard card}) async {}

  @override
  Future<void> addPayment() async {}

  @override
  Future<void> deleteCard({required CreditCard card}) async {}

  @override
  Future<void> deleteCart() async =>
      await _setString(key: _cartKey, value: null);

  @override
  Future<void> deletePayment() async {}

  @override
  Future<List<CreditCard>> getCards() async => [];

  @override
  Future<Cart?> getCart() async {
    final raw = await _getString(key: _cartKey);
    final jsonData = jsonDecode(raw ?? "");
    final cart = Cart.fromJson(jsonData);
    return cart;
  }

  @override
  Future<Cart> updateCart({required Cart cart}) async {
    final json = jsonEncode(cart.toJson());
    await _setString(key: _cartKey, value: json);
    return cart;
  }

  Future<void> _setInt({required String key, required int? value}) async {
    await prefs.setInt(key, value ?? -1);
  }

  Future<void> _setBool({required String key, required bool value}) async {
    await prefs.setBool(key, value);
  }

  Future<void> _setDouble({required String key, required double? value}) async {
    await prefs.setDouble(key, value ?? -1.0);
  }

  Future<void> _setString({required String key, required String? value}) async {
    await prefs.setString(key, value ?? "");
  }

  Future<int?> _getInt({required String key}) async {
    return prefs.getInt(key);
  }

  Future<bool?> _getBool({required String key}) async {
    return prefs.getBool(key);
  }

  Future<double?> _getDouble({required String key}) async {
    return prefs.getDouble(key);
  }

  Future<String?> _getString({required String key}) async {
    return prefs.getString(key);
  }
}
