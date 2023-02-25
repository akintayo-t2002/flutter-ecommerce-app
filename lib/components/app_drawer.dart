import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        children:[
          ListTile(
            leading:const Icon(Icons.shop),
            title:const Text('Shop'),
            onTap:(){Navigator.of(context).pushReplacementNamed('/');},
          ),
          ListTile(
            leading:Image.asset('assets/icons/payment.png'),
            title:const Text('Orders'),
            onTap:(){Navigator.of(context).pushReplacementNamed('/');},
          ),
        ],
      ),
    );
  }
}