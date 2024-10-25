part of 'create_cart_bloc.dart';

sealed class CreateCartEvent extends Equatable {
  const CreateCartEvent();

  @override
  List<Object> get props=>[];
}


class AddToCart extends CreateCartEvent{
  final Cart cart;
  const AddToCart(this.cart);

  @override
  List<Object> get props=>[cart];
}

class removeToCart extends CreateCartEvent{
  final Cart cart;
  const removeToCart(this.cart);

  @override
  List<Object> get props=>[cart];
}
class updateToCart extends CreateCartEvent{
  final Cart cart;
  const updateToCart(this.cart);

  @override
  List<Object> get props=>[cart];
}

class refreshToCart extends CreateCartEvent{}




