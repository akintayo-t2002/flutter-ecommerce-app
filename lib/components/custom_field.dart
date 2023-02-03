import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key,required this.hintText,required this.icon});

  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color:Colors.black,
          size: 30,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade500,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
