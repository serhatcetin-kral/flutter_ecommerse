import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: Stack(
        children: [
        Padding(
        padding: const EdgeInsets.symmetric( horizontal:16.0),
    child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      SizedBox(height: 29),
          //back button
          Icon(Icons.arrow_back,color: Colors.black,size: 27,),
          //categories
      SizedBox(height: 24,),
      Text("Categories", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
      SizedBox(height: 16,)

        ]))])));
  }
}
