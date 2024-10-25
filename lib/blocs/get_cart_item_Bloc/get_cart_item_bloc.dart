import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../cart/src/db_repo.dart';
import '../../cart/src/models/cart_model.dart';

part 'get_cart_item_event.dart';
part 'get_cart_item_state.dart';

class GetCartItemBloc extends Bloc<GetCartItemEvent, GetCartItemState> {
  final DbRepo dbRepo;
  GetCartItemBloc(this.dbRepo) : super(GetCartItemInitial()) {
    on<GetCartItems>((event,emit)async{
      emit(GetCartLoading());
      try{

        emit(GetCartSuccess(await dbRepo.getCartList()));
      }catch(e){
        emit(GetCartFailure());
      }

    });
  }
}
