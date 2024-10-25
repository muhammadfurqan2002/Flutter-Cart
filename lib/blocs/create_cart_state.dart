part of 'create_cart_bloc.dart';

sealed class CreateCartState extends Equatable {
  const CreateCartState();
  @override
  List<Object> get props => [];
}

final class CreateCartInitial extends CreateCartState {}


class CartAddedSuccess extends CreateCartState {
  final Cart cart;

  const CartAddedSuccess({required this.cart});

  @override
  List<Object> get props => [cart];
}

class CartUpdatedSuccess extends CreateCartState {
  final Cart cart;

  const CartUpdatedSuccess({required this.cart});

  @override
  List<Object> get props => [cart];
}

class CartRemovedSuccess extends CreateCartState {
  final String productId;

  const CartRemovedSuccess({required this.productId});

  @override
  List<Object> get props => [productId];
}

class CartRefreshedSuccess extends CreateCartState {
  final List<Cart> cartList;

  const CartRefreshedSuccess({required this.cartList});

  @override
  List<Object> get props => [cartList];
}





