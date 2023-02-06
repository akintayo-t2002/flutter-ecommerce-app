import 'package:flutter/material.dart';

class FavouritesItem extends StatelessWidget {
  const FavouritesItem({super.key, required this.productName, required this.imageUrl, required this.productCategory});

  final String productName;
  final String imageUrl;
  final String productCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow:[
         BoxShadow(
                color:Colors.grey.shade300,
                // blurRadius:2,
                offset:const Offset(3,5),
               ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Container(
              height:50,
              width:52,
              decoration:BoxDecoration(
                image:DecorationImage(
                  image:AssetImage(imageUrl),
                  fit:BoxFit.cover,
                ),
                color:const Color(0xFFe7e8f1),
                borderRadius:BorderRadius.circular(10),
              ),),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Text(productCategory),
            ],
          ),
        ],
      ),
    );
  }
}
