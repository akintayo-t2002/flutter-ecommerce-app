import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  const SaleCard(
      {super.key, required this.itemName, required this.itemPrice, required this.imageUrl});

  final String itemName;
  final String imageUrl;
  final String itemPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      itemPrice,
                      style:const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade800,
                  ),
                  child: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey.shade800,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          child: Image.asset(
                            'assets/icons/cart.png',
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
              ],
            )
          ],
        ));
  }
}
