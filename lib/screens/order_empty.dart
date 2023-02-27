import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  OrderEmpty({super.key});

 final _scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu)),
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Image.asset(
              'assets/icons/ticket.png',
              height: 300,
            ),
            const Text(
              'No Orders Yet',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Text(
              'Buy Something to see your order here',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
