class CartEntity{

String userId;
String productId;
String title;
String picture;
int initialPrice;
int productPrice;
int quantity;

CartEntity({
  required this.picture,
  required this.title,
  required this.userId,
  required this.quantity,
  required this.initialPrice,
  required this.productId,
  required this.productPrice
});



Map<String,Object?> toDocument(){

  return {
     "picture":picture,
     "title":title,
     "userId":userId,
     "quantity":quantity,
     "initialPrice":initialPrice,
     "productId":productId,
     "productPrice":productPrice
  };
}


static CartEntity fromDocument(Map<String,dynamic> map){
  return CartEntity(
      picture:map["picture"] ,
      title:map["title"] ,
      userId:map["userId"] ,
      quantity:map["quantity"] ,
      initialPrice:map["initialPrice"] ,
      productId:map["productId"] ,
      productPrice: map["productPrice"]
  );

}


}
