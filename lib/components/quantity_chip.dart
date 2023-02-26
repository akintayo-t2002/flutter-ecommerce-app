import 'package:flutter/material.dart';

class QuantityChip extends StatelessWidget {
  const QuantityChip({super.key, required this.onClicked, required this.icon});
final VoidCallback onClicked;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon),
        ));
  }
}
