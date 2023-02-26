import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
   const CategoriesTile({super.key, required this.category, required this.isClicked,required this.onTap});

  final String category;
  final bool isClicked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.only(right:15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isClicked ? Colors.transparent : Colors.black12,
            ),
            color: isClicked ? Colors.black : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
                color: isClicked ? Colors.white : Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
