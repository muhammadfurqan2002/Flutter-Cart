import 'package:fastfood/cart/src/entities/cart_entity.dart';

class Cart{
  String userId;
  String productId;
  String title;
  String picture;
  int initialPrice;
  int productPrice;
  int quantity;

  Cart({
    required this.picture,
    required this.title,
    required this.userId,
    required this.quantity,
    required this.initialPrice,
    required this.productId,
    required this.productPrice
  });


  static final empty= Cart(
    picture:"",
    title: "",
    userId: "",
    quantity:0,
    initialPrice:0,
    productId: "",
    productPrice:0
  );


  CartEntity toEntity(){
    return CartEntity(
      picture: picture,
      title: title,
      userId: userId,
      quantity: quantity,
      initialPrice: initialPrice,
      productId: productId,
      productPrice: productPrice
    );
  }

  static Cart fromEntity(CartEntity entity){
    return Cart(
        picture: entity.picture,
        title: entity.title,
        userId: entity.userId,
        quantity: entity.quantity,
        initialPrice: entity.initialPrice,
        productId: entity.productId,
        productPrice: entity.productPrice
    );
  }


}