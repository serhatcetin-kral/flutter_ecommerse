import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'categories.dart';
class HomePage extends StatefulWidget {

  @override
 _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(body: SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( horizontal:16.0),
            child: ListView(

              children: [
                //baslik
                buildBslik(),
                //banner
                buildBanner(),
                //navigation
                Padding(padding: EdgeInsets.only(top:48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildNagivation(text:"Catogories",icon:Icons.menu,widget: CategoriesPage(),context: context),
                      buildNagivation(text:"Favorites",icon:Icons.star_border),
                      buildNagivation(text:"Gifts",icon:Icons.card_giftcard),
                      buildNagivation(text:"Best selling",icon:Icons.people),
                    ],),),

                SizedBox(height: 40,),
                //SALE
                Text("Sales",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF0A1034)), ),
                SizedBox(height: 16,),
                //sales item
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [buildSalesItems(text: "SmartPhones",photoUrl: "assets/images/phone.png",discount: "-50%",screenWidth:screenWidth),
                  buildSalesItems(text: "SmartPhones",photoUrl: "assets/images/iphone.png",discount: "-50%",screenWidth:screenWidth),

                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [buildSalesItems(text: "SmartPhones",photoUrl: "assets/images/iphone.png",discount: "-50%",screenWidth:screenWidth),
                    buildSalesItems(text: "SmartPhones",photoUrl: "assets/images/phone.png",discount: "-50%",screenWidth:screenWidth),

                  ],)

              ],),
          ),
       Align(
         alignment: Alignment.bottomCenter,
         child: Container(
           decoration: BoxDecoration(
             boxShadow:[BoxShadow(offset:Offset(0,-3),color: Colors.black.withOpacity(0.25),
             blurRadius: 10)],
             color: Color(0xffeff5fb),
         ),


           width: double.infinity,
          // padding: EdgeInsets.symmetric(vertical:20),
           padding: EdgeInsets.only(left: 20,right: 20,top:20,bottom: 20),

         child: Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween,
           children: [
           buildNavIcon(iconData: Icons.home_filled, active:true),
           buildNavIcon(iconData: Icons.search, active:false),
           buildNavIcon(iconData: Icons.shopping_basket,active:false),
           buildNavIcon(iconData: Icons.people, active:false),
         ],),
         ),
       )
        ],
      ),


    ),);
  }
}

buildNavIcon({required IconData iconData,required bool active}){
return  Icon(iconData,size: 20,color: Color(active ? 0xff0001fc :0xff0a1034 ),);

}

buildBslik(){
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text('Home',style: TextStyle(fontSize: 32,color: Colors.black,fontWeight: FontWeight.bold),),
  );

}

buildBanner(){
  return Padding(padding: EdgeInsets.only(top: 24),
    child:Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24,right: 36,top: 14,bottom: 18),
      decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(6)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Bose Home speaker',style: TextStyle(color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),),
              SizedBox(height: 6,),
              Text('USD 19018',style: TextStyle(color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
              ),)
            ],),

          Expanded(child: Image.asset("assets/images/speaker.png",width: 125,height: 100,))

        ],),

    ) ,
  );

}

buildNagivation( {required String text,required IconData icon,Widget? widget,BuildContext? context}){
  return GestureDetector( //DOKUNUNCA TIKLAYABILMEK ICIN
      onTap: (){
        Navigator.push(context!,MaterialPageRoute(builder: (context){
          return widget ?? Container();
        }));
      },


      child: Column(children: [
        Container(
          padding:EdgeInsets.symmetric(horizontal: 19,vertical:22),
          decoration: BoxDecoration(shape: BoxShape.circle,
              color: Color(0xFFE0ECF8)),
          child: Icon(icon,
            color: Color(0xFF0001FC),size: 18,),
        )
        ,SizedBox(height: 8,)
        ,Text(text,style: TextStyle(color: Color(0xFF1F53E4),fontSize: 14,fontWeight: FontWeight.w500),),

      ],)

  );
}

buildSalesItems({required String text,required String photoUrl,required String discount,required double screenWidth}){
  return  Container(
    width: (screenWidth-60)*0.5,
    padding: EdgeInsets.only(left:12,top: 12,bottom: 21,right: 12),
    child: Column(children: [
      Container(

        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),color: Color(0xFFE0Ecf8)),
        child: Text(discount,style: TextStyle(color: Color(0xff1f53e4),fontSize: 12),),
      ),

      SizedBox(height:22),
      Image.asset(photoUrl),
      SizedBox(height:22),
      Center(child: Text(text,style: TextStyle(fontSize: 18,color: Color(0xff0a1034)),) ,)

    ],

    ),
  );
}