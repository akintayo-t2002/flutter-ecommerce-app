import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({super.key, required this.child,required this.value,required this.color});

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 3,
          top: 3,
          child: Container(
            padding:const EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:color,
            ),
            constraints:const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style:const TextStyle(
                fontSize: 10,
                color:Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
