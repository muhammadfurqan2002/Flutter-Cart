import 'models/cart_model.dart';

abstract class CartRepo{
  Future<Cart> insert(Cart cart);
  Future<List<Cart>> getCartList();
  Future<int> update(Cart cart);
}