import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerceapp/components/app_drawer.dart';
import 'package:ecommerceapp/components/categories_tile.dart';
import 'package:ecommerceapp/components/custom_field.dart';
import 'package:ecommerceapp/components/icon_box.dart';
import 'package:ecommerceapp/components/salecard.dart';
import 'package:ecommerceapp/components/small_item_card.dart';
import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:ecommerceapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/badge.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((_) {
   Provider.of<ProductsProvider>(context,listen:false).filteredProd(0);
});
    super.initState();
  }


 final _scaffoldKey= GlobalKey<ScaffoldState>();
  

  
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      key:_scaffoldKey,
      drawer:const AppDrawer(),
      body:Consumer<ProductsProvider>(
        builder:(context,value,child)=>SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                  IconBox(child:IconButton(
                      onPressed:(){
                        _scaffoldKey.currentState!.openDrawer();
                      }, 
                      icon:const Icon(Icons.menu))),
                GestureDetector(
                  onTap:(){
                    Navigator.pushNamed(context,'/third');
                  },
                  child: Consumer<CartProvider>(
                    builder:(context,value,child)=>Badge(
                    color:Colors.red,
                    value:value.cartCount.toString(),
                    child: IconBox(child:Image.asset('assets/icons/shopping-bag.png'))
                  ),
                  )
                )
                  ],
                ),
                const Text('Discover',
                style:TextStyle(
                  fontSize:28,
                  fontWeight:FontWeight.w700,
                ),),
                 const SizedBox(height:10,),
               const CustomField(hintText:'Search', icon:Icons.search),
               const SizedBox(height:10,),
               SizedBox(
                height:size.height*0.06,
                 child: ListView.builder(
                  itemCount:value.categories.length,
                  itemBuilder:(ctx,i)=>CategoriesTile(
                    category: value.categories[i].title, 
                    isClicked:value.categories[i].isSelected, 
                    onTap:(){
                      value.categorySelected(i);
                      value.filteredProd(i);
                    }),
                    scrollDirection:Axis.horizontal,
                 ),
               ),
               const SizedBox(height:15,),
               Expanded(
                 child: SingleChildScrollView(
                  child:Column(
                    children: [
                      SizedBox(
                        height:size.height*0.24,
                        child: Consumer2<CartProvider,ProductsProvider>(
                          builder:((context,cart,product, child) =>Swiper(
                          autoplay:value.getFirstThree.length>1 ?true:false,
                          pagination:const SwiperPagination(
                            builder:DotSwiperPaginationBuilder(
                            activeColor: Colors.grey,
                            )
                          ),
                          itemCount:product.getFirstThree.length,
                          itemBuilder:(ctx,i)=>SaleCard(
                            itemName:product.getFirstThree[i].title,
                            itemPrice:product.getFirstThree[i].price, 
                            imageUrl:product.getFirstThree[i].imageUrl, 
                            onTap: () {
                              cart.addItem(
                                 product.getFirstThree[i].id,
                                 product.getFirstThree[i].title,
                                product.getFirstThree[i].price,
                                product.getFirstThree[i].imageUrl,
                               );
                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              showSnackBar(context,message:'Item added successfully',onPressed:(){
                                    cart.removeSingleitem(product.getFirstThree[i].id);});
                            },),
                        )),
                        )
                      ),
                      const SizedBox(height:15,),
                      GridView.builder(
                        shrinkWrap:true,
                        physics:const NeverScrollableScrollPhysics(),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:2,
                          mainAxisSpacing:10,
                          crossAxisSpacing:10,
                          childAspectRatio:0.9,
                        ),
                        itemCount:value.getFilteredProducts.length,
                        itemBuilder:(ctx,index)=>Hero(
                          tag:value.getFilteredProducts[index].id,
                          child: GestureDetector(
                            onTap:(){
                              Navigator.of(context).pushNamed('/first',arguments:value.getFilteredProducts[index].id);
                            },
                            child: SmallItemCard(
                              itemName: value.getFilteredProducts[index].title, 
                              imageUrl:value.getFilteredProducts[index].imageUrl , 
                              itemPrice:value.getFilteredProducts[index].price, 
                              isToggled:value.getFilteredProducts[index].isFavourite,
                              onTap: (){
                              value.toggleFavourites(value.getFilteredProducts[index].id);},
                              ),
                              
                          ),
                        ),
                      )
                    ],
                  ),
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}