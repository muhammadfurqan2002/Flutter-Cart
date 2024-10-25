import 'dart:ui';

import 'package:fastfood/blocs/create_cart_bloc.dart';
import 'package:fastfood/blocs/get_cart_item_Bloc/get_cart_item_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart/src/models/cart_model.dart';

class CART extends StatefulWidget {
  const CART({super.key});

  @override
  State<CART> createState() => _CARTState();
}

class _CARTState extends State<CART> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartItemBloc>().add(GetCartItems());
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<GetCartItemBloc, GetCartItemState>(
        builder: (context, state) {
          if (state is GetCartSuccess) {
            double total = state.carts.fold(0, (sum, cart) => sum + (cart.productPrice * cart.quantity));

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: h * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Cart",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Total: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                            "\$${total.toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: h,
                    child: ListView.builder(
                      itemCount: state.carts.length,
                      itemBuilder: (context, index) {
                        return CartWidget(
                          cart: state.carts[index],
                          onQuantityChanged: (newCart) {
                            // Update the state only for the changed cart item
                            setState(() {
                              state.carts[index] = newCart;
                            });
                          },
                          onItemRemoved: () {
                            // Remove the item from the list
                            setState(() {
                              state.carts.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}

class CartWidget extends StatefulWidget {
  final Cart cart;
  final Function(Cart) onQuantityChanged;
  final VoidCallback onItemRemoved;

  const CartWidget({
    super.key,
    required this.cart,
    required this.onQuantityChanged,
    required this.onItemRemoved,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  void _updateQuantity(int delta) {
    int newQuantity = widget.cart.quantity + delta;
    if (newQuantity < 1) return; // Prevent negative quantity

    Cart updatedCart = Cart(
      picture: widget.cart.picture,
      title: widget.cart.title,
      userId: widget.cart.userId,
      quantity: newQuantity,
      initialPrice: widget.cart.initialPrice,
      productId: widget.cart.productId,
      productPrice: widget.cart.productPrice,
    );

    // Optimistic UI update
    widget.onQuantityChanged(updatedCart);

    // Perform the actual update in the backend
    context.read<CreateCartBloc>().add(updateToCart(updatedCart));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: w,
        height: h * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 1,
              left: w * .10,
              bottom: 0,
              right: 2,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  width: w * .85,
                  height: h * 0.18,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: h * 0.01),
                              Text(
                                widget.cart.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.cart.title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${widget.cart.productPrice.toString()}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _updateQuantity(1); // Increase quantity
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(60),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              CupertinoIcons.plus,
                                              size: 20,
                                              color: Colors.red.shade500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: w * 0.03),
                                      Text(
                                        widget.cart.quantity.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: w * 0.03),
                                      InkWell(
                                        onTap: () {
                                          _updateQuantity(-1); // Decrease quantity
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(60),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              CupertinoIcons.minus,
                                              size: 20,
                                              color: Colors.red.shade500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * 0.038,
              left: 0,
              child: Center(
                child: Image.asset(
                  widget.cart.picture,
                  height: 80,
                  width: 90,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 30,
              child: InkWell(
                onTap: () {
                  // Optimistically remove the item
                  widget.onItemRemoved();

                  // Perform the actual remove operation
                  context.read<CreateCartBloc>().add(removeToCart(widget.cart));
                },
                child: const Icon(
                  Icons.delete_outline,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
