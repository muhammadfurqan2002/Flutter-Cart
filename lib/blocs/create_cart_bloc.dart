
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fastfood/cart/src/db_repo.dart';
import 'package:fastfood/cart/src/models/cart_model.dart';


part 'create_cart_event.dart';
part 'create_cart_state.dart';

class CreateCartBloc extends Bloc<CreateCartEvent, CreateCartState> {
  final DbRepo dbRepo;
  CreateCartBloc(this.dbRepo) : super(CreateCartInitial()) {
    on<AddToCart>((event, emit)async {
      try{
          Cart cart=await dbRepo.insert(event.cart);
          emit(CartAddedSuccess(cart: cart));
      }catch(e){
        print(e);
      }
    });

    on<removeToCart>((event,emit)async{
      String id=event.cart.productId;
      await dbRepo.delete(event.cart.productId);
      emit(CartRemovedSuccess(productId: id));
    });

    on<updateToCart>((event,emit)async{
      await dbRepo.update(event.cart);
    });


  }
}
