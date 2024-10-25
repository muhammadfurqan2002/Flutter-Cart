
import 'package:fastfood/blocs/create_cart_bloc.dart';
import 'package:fastfood/cart/src/db_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart/src/models/cart_model.dart';

class homePageItems extends StatefulWidget {

  final String title,path,price;
  const homePageItems({super.key,required this.title,required this.path,required this.price});

  @override
  State<homePageItems> createState() => _homePageItemsState();

}

class _homePageItemsState extends State<homePageItems> {

  late Cart cart;

  @override
  void initState() {
    // TODO: implement initState
    cart=Cart.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return  BlocBuilder<CreateCartBloc, CreateCartState>(
      builder: (context, state) {
    return Padding(
      padding:const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: SizedBox(
        // color: Colors.black,
        height: h*0.30,
        width: w*.41,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top:50,
              child: Container(
                height:h*.22,
                width:w*.4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
            Positioned(
              top: 110,
              child: SizedBox(
                child:  Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title,style:const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: h*.003,),
                    const Text("Chicken Patty, Cheese,\nTomato,Lecttuce",textAlign: TextAlign.center,style:TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    )),
                    // SizedBox(height: h*.015,),
                    SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Ink(
                          child: GestureDetector(
                            onTap: (){
                                  setState(() {
                                      cart.title=widget.title;
                                      cart.quantity=1;
                                      cart.userId="furqan";
                                      cart.productId="${widget.title}";
                                      cart.picture="${widget.path}";
                                      cart.productPrice=int.parse( widget.price);
                                      cart.initialPrice=int.parse( widget.price);
                                  });
                                  // print(cart);
                                 context.read<CreateCartBloc>().add(AddToCart(cart));
                            },
                            child:const Padding(padding: EdgeInsets.all(3),
                                child: Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 20,)
                            ),
                          ),
                        ),
                        SizedBox(width: h*0.08,),
                        Text('\$${widget.price}',style:const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 10,
                child: Container(
                  // color: Colors.red,
                    height: h*.12,
                    // width: w*.35,
                    child: Image.asset(widget.path,fit: BoxFit.cover,))),

          ],
        ),
      ),
    );
  },
);
  }
}


