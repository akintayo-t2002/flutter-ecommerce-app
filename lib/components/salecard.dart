import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  const SaleCard(
      {super.key, required this.itemName, required this.itemPrice, required this.imageUrl,required this.onTap});

  final String itemName;
  final String imageUrl;
  final double itemPrice;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height:10,),
                    Text(
                      itemName,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\$$itemPrice',
                      style:const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height:15,),
            GestureDetector(
              onTap:onTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal:25, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade900,
                ),
                child: Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/icons/shopping-bag.png',
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    imageUrl,
                    height: 120,
                  ),
                )
              ],
            ),
            
          ],
        ));
  }
}
