part of 'get_cart_item_bloc.dart';

sealed class GetCartItemEvent extends Equatable {
  const GetCartItemEvent();

  @override
  List<Object> get props=>[];
}


class GetCartItems extends GetCartItemEvent{}


