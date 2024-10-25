part of 'get_cart_item_bloc.dart';

sealed class GetCartItemState extends Equatable {
  const GetCartItemState();
  @override
  List<Object> get props => [];
}

final class GetCartItemInitial extends GetCartItemState {}

final class GetCartSuccess extends GetCartItemState {
  final List<Cart> carts;
  const GetCartSuccess(this.carts);

  @override
  List<Object> get props => [carts];
}
final class GetCartLoading extends GetCartItemState{}
final class GetCartFailure extends GetCartItemState{}

