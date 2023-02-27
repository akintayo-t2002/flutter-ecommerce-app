import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        children:[
          const SizedBox(height:70,),
          ListTile(
            leading:const Icon(Icons.shopify_rounded,size:35,color:Colors.black,),
            title:const Text('Store',style:TextStyle(
              fontSize:18
            ),),
            onTap:(){Navigator.of(context).pushReplacementNamed('/');},
          ),
          ListTile(
            leading:Image.asset('assets/icons/payment.png'),
            title:const Text('My Orders',style:TextStyle(
              fontSize:18
            )),
            onTap:(){Navigator.of(context).pushReplacementNamed('/fourth');},
          ),
        ],
      ),
    );
  }
}