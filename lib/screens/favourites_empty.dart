import 'package:flutter/material.dart';

class FavouritesEmpty extends StatelessWidget {
  const FavouritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor:Colors.white,
        elevation:0,
        centerTitle:false,
        title:const Text('My Favorites',style:TextStyle(
          fontWeight:FontWeight.w700,
          fontSize:25,
          color:Colors.black,
        ),),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/box-open.png',color:Colors.grey.shade500,),
            const SizedBox(height:30,),
             Text('Oops, you don\'t have any favourites!',style:TextStyle(
              fontSize:18,
              color:Colors.grey.shade800,
              // fontWeight:FontWeight.w700,
            ),),
            const SizedBox(height:10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:35.0),
              child: Text('Explore products and mark them as favourites to see them here',style:TextStyle(
                fontSize:15,
                color:Colors.grey.shade500,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}