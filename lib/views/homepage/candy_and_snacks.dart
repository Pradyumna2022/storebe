import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storebobypradyumna/constant/constant.dart';

class CandyAndSnacks extends StatefulWidget {
  const CandyAndSnacks({super.key});

  @override
  State<CandyAndSnacks> createState() => _CandyAndSnacksState();
}

class _CandyAndSnacksState extends State<CandyAndSnacks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),
                Text("CandyAndSnacks",style: TextStyle(
                  fontSize: 18,fontFamily: titleFontFamily,fontWeight: FontWeight.bold,
                ),),
                Image.asset('assets/images/filter.png',scale: 1.3,)
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 350
                ),
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                          color: Colors.grey,width: 1
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            height:Get.height*0.24,
                            width: Get.width*0.39,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.grey[200]
                            ),
                            child: Image.asset('assets/images/'),
                          )
                        ],
                      ),
                    );
              }),
            )
          ],
        ),
      ),
    );
  }
}
