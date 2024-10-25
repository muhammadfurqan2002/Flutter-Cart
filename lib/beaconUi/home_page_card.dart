
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class BeaconHomePageCard extends StatelessWidget {
  const BeaconHomePageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          // height:MediaQuery.of(context).size.height,
          height:h*0.7,
          width: w,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color: Colors.red,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(width: w*0.02,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BOSS HO"),

                              SizedBox(height:h*0.01 ,),
                              Row(
                                children: [
                                  Text("16/19/25"),
                                  SizedBox(width:h*0.01 ,),
                                  Text("14:34:55"),

                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(CupertinoIcons.ellipsis_vertical)
                    ],
                  ),
                  SizedBox(height: h*0.02,),
                  Container(
                    width: w,
                    height: h/3,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),

                    ),
                  ),
                ReadMoreText(
                  """We are pleased to announce the Distinguished Alumni Award for accomplished, well known BSS alumni as a means of acknowledging them for their hard work and achievements. The Distinguished Alumni Award is a sense of belonging, a warm welcome back home. Most past pupils say that their school was a second home to them, The Distinguished Alumni Award is their homecoming gift. Our goal is to create goodwill and endorse a lasting relationship between the alumni and their alma mater. The aim is to honor former BSS pupils by giving them a sense of belonging and ownership while taking pride in their accomplishments.
                  Beaconhouse BOSS is not just a brand, it is a community, and a family that binds every single Beaconhouse alumni and their school together"""
                ,trimMode: TrimMode.Line,
                trimLines: 3,
                isExpandable: true,
                colorClickableText: Colors.pink,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
