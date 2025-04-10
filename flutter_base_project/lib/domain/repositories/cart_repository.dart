import '../models/cart/cart.dart' show Cart;
import '../models/product/product.dart' show Product;

abstract interface class CartRepository {
  Future<Cart?> getCart();
  Future<Cart?> addProduct({required Product product});
  Future<Cart?> removeProduct({required Product product});
  Future<void> checkOut({required Cart cart});
}