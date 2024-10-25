import 'dart:ui';

import 'package:fastfood/blocs/get_cart_item_Bloc/get_cart_item_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart.dart';
import 'homepageitems.dart';




class FastFoodHome extends StatelessWidget {
   FastFoodHome({super.key});

   List<Map<String, dynamic>> items = [
     {
       "title": "Margherita",
       "price": "9",
       "description": "Classic Italian with tomato sauce, mozzarella, and basil",
       "image":"images/FastFood/value_meal1.png"
     },
     {
       "title": "Pepperoni",
       "price": "10",
       "description": "A timeless favorite featuring pepperoni slices and melted cheese"
      ,"image":"images/FastFood/kfc_hero.png"
     },
     {
       "title": "Vegetarian",
       "price": "11",
       "description": "Loaded with fresh vegetables and cheese for a flavorful meat-free option"
      ,"image":"images/FastFood/burger3.png"
     },
     {
       "title": "Ice Tea",
       "price": "11",
       "description": "Loaded with fresh vegetables and cheese for a flavorful meat-free option"
      ,"image":"images/FastFood/ice_tea.png"
     },
     // Add more items here
   ];




  @override
  Widget build(BuildContext context) {

    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: w*.03,right:w*.03 ,top: h*.06),
        child: SizedBox(
          child: Column(
            children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Stack(
                             alignment: Alignment.center,
                             children: [
                               Container(
                                 height: w*.15,
                                 width: w*.15,
                                 decoration:const BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Colors.red,
                                 ),
                               )
                             ],
                           ),
                           SizedBox(width: w*.02,),
                           const Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Nearby Outlet",style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 15,
                                 color: Colors.black54
                               ),),
                               Text("Zindabazar, Sylhet",style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black87
                               ),),
                             ],
                           )
                         ],
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CART()));
                          },
                          child: const Icon(Icons.shopping_bag_outlined,size: 30,))
                    ],
                  ),
              SizedBox(height: h*.02,),
              Container(
                width: w,
                height: h*.07,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w*.25,
                        height: h*.055,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child:const Center(child: Text("Single",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),),),
                      ),
                      Container(
                        width: w*.25,
                        height: h*.055,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child:const Center(child: Text("Combo",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54
                        ),),),
                      ),
                      Container(
                        width: w*.25,
                        height: h*.055,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child:const Center(child: Text("Bucket",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54
                        ),),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:h*.02,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple.shade50,
                ),
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal:w*.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TUESDAY DEAL",style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            letterSpacing: 2
                          ),),
                          // SizedBox(height: 4,),
                          Text("20pcs Chicken\nBucket",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                          ),),
                          SizedBox(height: 15,),
                          Text("9AM - 10PM",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),),

                        ],
                      ),
                      SizedBox(
                        height:h*.15,
                        width: w*.3,
                        // color: Colors.red,
                        child:Image.asset("images/FastFood/value_meal1.png",fit: BoxFit.fill,) ,
                      )

                    ],
                  ),
                ),
              ),
              SizedBox(height: h*.02,),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            homePageItems(title:items[0]['title'], path:items[0]['image'], price:items[0]['price'],),
                            homePageItems(title:items[1]['title'], path:items[1]['image'], price:items[1]['price'],)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            homePageItems(title:items[2]['title'], path:items[2]['image'], price:items[2]['price']),
                            homePageItems(title:items[3]['title'], path:items[3]['image'], price:items[3]['price']),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}



