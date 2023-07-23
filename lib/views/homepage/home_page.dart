import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storebobypradyumna/constant/constant.dart';
import 'package:storebobypradyumna/widgets/search_widget.dart';

import 'candy_and_snacks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List imagesList = [
    'assets/images/firstimage.png',
    'assets/images/3im.png',
    'assets/images/4im.png',
    'assets/images/5im.png',
  ];
  @override
  Widget build(BuildContext context) {
    List _widgetList =[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_sharp,color: Colors.red,size: 34,),
                          Text("Home",style: TextStyle(fontFamily: subtitleFontFamily,fontWeight: FontWeight.bold,
                              fontSize: titleFontSize),)
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.green,)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.card_travel,color: Colors.green,)),
                          IconButton(onPressed: (){
                          }, icon: Icon(Icons.menu,color: Colors.green,),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SearchWidget(hint: 'Search...'),
              SizedBox(height: 10,),
              Container(
                height: 135,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Image.asset('assets/images/banner.png');
                    }),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shop By Category",style: TextStyle(
                                fontSize: subtitleFontSize,fontWeight: FontWeight.bold,fontFamily: subtitleFontFamily
                            ),),
                            Text("See All",style: TextStyle(
                                fontSize: subtitleFontSize,fontWeight: FontWeight.bold,fontFamily: subtitleFontFamily,color: Colors.green
                            ),)
                          ],
                        ),
                        SizedBox(height: 15,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Stack(
                                  children:[
                                    CircleAvatar(
                                      backgroundColor: Colors.amber[800],
                                      radius: 35,
                                    ),
                                    Positioned(
                                        top: 17,
                                        right: 20,
                                        child: Image.asset('assets/images/candy.png',scale: 0.7,))
                                  ]
                              ),
                              Text("Candy &\n Snacks",style: TextStyle(
                                fontFamily: subtitleFontFamily,fontSize: 14,
                              ),textAlign: TextAlign.justify,)
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                  children:[
                                    CircleAvatar(
                                      backgroundColor: Colors.red[800],
                                      radius: 35,
                                    ),
                                    Positioned(
                                        top: 17,
                                        right: 20,
                                        child: Image.asset('assets/images/vitamin.png',scale: 0.7,))
                                  ]
                              ),
                              Text("Vitamins &\nEnergy\nBoosters",style: TextStyle(
                                fontFamily: subtitleFontFamily,fontSize: 14,
                              ),textAlign: TextAlign.center,)
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                  children:[
                                    CircleAvatar(
                                      backgroundColor: Colors.green[800],
                                      radius: 35,
                                    ),
                                    Positioned(
                                        top: 17,
                                        right: 20,
                                        child: Image.asset('assets/images/health.png',scale: 0.7,))
                                  ]
                              ),
                              Text("Personal &\nHealth\nCare",style: TextStyle(
                                fontFamily: subtitleFontFamily,fontSize: 14,
                              ),textAlign: TextAlign.center,)
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                  children:[
                                    CircleAvatar(
                                      backgroundColor: Colors.deepPurple[800],
                                      radius: 35,
                                    ),
                                    Positioned(
                                        top: 17,
                                        right: 20,
                                        child: Image.asset('assets/images/homegoods.png',scale: 0.7,))
                                  ]
                              ),
                              Text("Home Goods\n&\nSupplies",style: TextStyle(
                                fontFamily: subtitleFontFamily,fontSize: 14,
                              ),textAlign: TextAlign.center,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ListView.builder(
                  // m: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: imagesList.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset(imagesList[index],fit: BoxFit.cover,),
                      );
                    }
                ),
              ),

            ],
          ),
        ),
      ),
      CandyAndSnacks(),
      Text("hfdhsf"),
      Text("hfdhsf"),
      Text("hfdhsf"),

    ];
    void onTapIndex(int index){
      setState(() {
        currentIndex = index;
      });
    }
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.category_sharp),label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'WishList'),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],
          currentIndex: currentIndex,
          onTap: onTapIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.red[200],
          selectedFontSize: subtitleFontSize,

        ),
        endDrawer: Drawer(),
        body: _widgetList.elementAt(currentIndex),

      ),
    );
  }
}
