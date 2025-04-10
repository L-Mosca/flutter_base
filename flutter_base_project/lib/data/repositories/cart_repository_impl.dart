import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final PreferencesHelper preferencesHelper;

  CartRepositoryImpl({required this.preferencesHelper});

  @override
  Future<Cart?> addProduct({required Product product}) async {}

  @override
  Future<Cart?> getCart() async {}

  @override
  Future<Cart?> removeProduct({required Product product}) async {}

  @override
  Future<void> checkOut({required Cart cart}) async {}
}
