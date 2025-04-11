import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final PreferencesHelper preferencesHelper;

  CartRepositoryImpl({required this.preferencesHelper});

  @override
  Future<Cart> addProduct({required Product product}) async {
    final cart = await getCart() ?? Cart.createNewCart();
    cart.addProduct(product);
    _updateCart(cart: cart);
    return cart;
  }

  @override
  Future<Cart?> getCart() async => await preferencesHelper.getCart();

  @override
  Future<Cart?> removeProduct({required Product product}) async {
    final cart = await getCart() ?? Cart.createNewCart();
    cart.removeProduct(product);
    _updateCart(cart: cart);
    return cart;
  }

  @override
  Future<void> checkOut({required Cart cart}) async {
    await preferencesHelper.deleteCart();
  }

  Future<void> _updateCart({required Cart cart}) async {
    await preferencesHelper.updateCart(cart: cart);
  }
}
