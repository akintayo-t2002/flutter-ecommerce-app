import 'dart:math';

import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier{

  // dummy products data
  final List<Product> _product=[
    Product(
      id:'p0',
      category:'Headphones',
      title:'Airpod 3',
      price:500,
      description:'The groundbreaking Airpod 3 released recently by the apple team.Powered by the all-new Universal H1 headphone chip, deliver a faster and more stable wireless connection to your devices are” up to 2x faster when switching between active devices, and a 1.5x faster connection time for phone calls.',
      imageUrl:'assets/images/airpod3.png',
    ),
    Product(
      id:'p1',
      category:'Consoles',
      title:'PS5 Controller',
      price:100,
      description:'Experience a deep sense of immersion with the Sony DualSense Wireless Controller, which is specially designed for the PlayStation 5 gaming console. In addition to having responsive game buttons, dual analog sticks, a D-pad, and a clickable 2-point capacitive touch pad, the DualSense enhances supported gaming experiences with vibrational haptic feedback that allow you to feel various effects, bumps, and surface textures.',
      imageUrl:'assets/images/controller2.png',
    ),
    Product(
      id:'p2',
      title:'Earbud',
      category: 'Headphones',
      price:250,
      description:'The groundbreaking Earbud released recently released.',
      imageUrl:'assets/images/earbud.png',
    ),
    Product(
      id:'p3',
      title:'Macbook Pro',
      category:'Laptops',
      price:1200,
      description:'Packed with 33.7 billion transistors, the Apple M1 Pro integrates the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC). Built with 5nm process technology, the Apple M1 Pro delivers the performance you need without sacrificing power efficiency.',
      imageUrl:'assets/images/macbookpro1.png',
    ),
    Product(
      id:'p4',
      title:'M1 Macbook Pro 16.2\'\'',
      category: 'Laptops',
      price:1500,
      description:'The groundbreaking Macbook Pro released recently by the apple team.The new MacBook Pro delivers game-changing performance for pro users.',
      imageUrl:'assets/images/m1macbookpro.png',
    ),
    Product(
      id:'p5',
      title:'Tablet Pro',
      category:'Phones',
      price:500,
      description:'The groundbreaking Tablet Pro released recently released',
      imageUrl:'assets/images/tabletpro.png',
    ),
    Product(
      id:'p6',
      title:'Smart TV',
      category:'Television',
      price:500,
      description:'Improve your home experience with the new Smart TV recently released',
      imageUrl:'assets/images/tv.png',
    ),
    Product(
      id:'p7',
      title:'MX Wireless Headphone',
      category:'Headphones',
      price:230,
      description:'The groundbreaking MX Wireless Headphone recently released.',
      imageUrl:'assets/images/mxwireless.png',
    ),
    Product(
      id:'p8',
      title:'H2 Wireless',
      category:'Headphones',
      price:350,
      description:'With Designed ergonomically, the Type C Headphone can fit the ear perfectly and wear comfortably even for long periods of time without any pain. Anti-wrap oxygen-free copper wire inside provides the whole earphones flexibility, make you not only easily walk through backpack and clothes while moving outside activities.',
      imageUrl:'assets/images/h2wireless.png',
    ),
    Product(
      id:'p9',
      title:' M2 Macbook Air',
      category:'Laptops',
      price:2000,
      description:'The M2 chip starts the next generation of Apple silicon, with even more of the speed and power efficiency of M1. So you can get more done faster with a more powerful 8‑core CPU. Work with more streams of 4K and 8K ProRes video with the high‑performance media engine. And keep working — or playing — all day and into the night with up to 18 hours of battery life.',
      imageUrl:'assets/images/m2macbook.png',
    ),
     Product(
      id:'p10',
      title:'Iphone 12 ',
      category:'Phones',
      price:850,
      description:'The phone comes with a 6.1-inch touchscreen display with a resolution of 1170x2532 pixels at a pixel density of 460 pixels per inch (ppi). The iPhone 12 supports wireless charging, as well as proprietary fast charging.As far as the cameras are concerned, the iPhone 12 on the rear packs a 12-megapixel primary camera with an f/1.6 aperture and a second 12-megapixel camera with an f/2.4 aperture. The rear camera setup has autofocus. It sports a 12-megapixel camera on the front for selfies, with an f/2.2 aperture.',
      imageUrl:'assets/images/iphone12.png',
    ),
    Product(
      id:'p11',
      title:'Foldable Headset',
      category:'Headphones',
      price:250,
      description:'The groundbreaking Foldable Headset released recently',
      imageUrl:'assets/images/foldable.png',
    ),
    Product(
      id:'p12',
      title:'IPhone 14',
      category:'Phones',
      price:1000,
      description:'The groundbreaking Iphone 14 released by Apple',
      imageUrl:'assets/images/iphone14.png',
    ),
    Product(
      id:'p13',
      title:'Samsung Galaxy A23',
      category:'Phones',
      price:500,
      description:'The groundbreaking Samsung Galaxy A23 recently released by Samsung',
      imageUrl:'assets/images/galaxyA23.png',
    ),
    Product(
      id:'p14',
      title:'IPhone XR',
      category:'Phones',
      price:1200,
      description:'The groundbreaking Iphone XR released by Apple',
      imageUrl:'assets/images/iphonexr.png',
    ),
    Product(
      id:'p15',
      title:'Porodo Wireless',
      category:'Headphones',
      price:1200,
      description:'The groundbreaking Porodo Wireless released recently',
      imageUrl:'assets/images/porodowireless.png',
    ),
     Product(
      id:'p16',
      title:'Macbook Pro 14''',
      category:'Laptops',
      price:2000,
      description:'Packed with 33.7 billion transistors, the Apple M1 Pro integrates the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC). Built with 5nm process technology, the Apple M1 Pro delivers the performance you need without sacrificing power efficiency',
      imageUrl:'assets/images/macbookpro14.png',
    ),
    Product(
      id:'p17',
      title:'Iphone 11 Pro',
      category:'Phones',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/iphone11pro.png',
    ),
    Product(
      id:'p18',
      title:'Kuhl 32\'\' Smart TV',
      category:'Televisions',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/tv1.png',
    ),
    Product(
      id:'p19',
      title:'Samsung smart TV',
      category:'Televisions',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/tv2.png',
    ),
    Product(
      id:'p20',
      title:'LG LED TV',
      category:'Televisions',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/tv3.png',
    ),
    Product(
      id:'p21',
      title:'Samsung 43\'\' LED TV',
      category:'Televisions',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/tv4.png',
    ),
    Product(
      id:'p22',
      title:'PS4',
      category:'Consoles',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/ps4.png',
    ),
    Product(
      id:'p23',
      title:'PS5',
      category:'Consoles',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/ps5.png',
    ),
     Product(
      id:'p24',
      title:'Nintendo WII',
      category:'Consoles',
      price:2000,
      description:'The groundbreaking Iphone 11 Pro released by Apple',
      imageUrl:'assets/images/nintendo.png',
    ),
  ];


  List<Category> categories=[
    Category(
      id:'Laptops',
      title:'Laptops',
      isSelected:true,
    ),
    Category(
      id:'Phones',
      title:'Phones',
      isSelected:false,
    ),
    Category(
      id:'Televisions',
      title:'Televisions',
      isSelected:false,
    ),
    Category(
      id:'Consoles',
      title:'Consoles',
      isSelected:false,
    ),
    Category(
      id:'Headphones',
      title:'Headphones',
      isSelected:false,
    )
   ];

  
  // A getter which returns the products list
List<Product> get products=>_product;

   // getter for categories list
List<Category> get category=>[...categories];

  
  // this getter returns the first three products in the filtered products list
List get getFirstThree=>_filteredProducts.sublist(0,min(_filteredProducts.length,3));

//getter which returns the filtered products
 List<Product> get getFilteredProducts=> _filteredProducts;

// This function filters products by matching the id with each product with the category id
 List<Product> _filteredProducts=[];
 void filteredProd(int index){
   _filteredProducts= products.where((prod) =>prod.category.contains(categories[index].id)).toList();
  notifyListeners();
}

// function which returns the first product which matches the id
Product findbyId(String id){
  return _product.firstWhere((prod) =>prod.id==id);
}

//function which helps to switch categories based on the provided index
void categorySelected(int index){
 for(int i=0; i<categories.length; i++) {
    categories[i].isSelected=false;
    categories[index].isSelected=true;
    notifyListeners();
 }
}

List<Product> favorites=[];

// function which marks a product as favourite
void toggleFavourites(String productId) {
  final existingProductIndex =
      products.indexWhere((product) => product.id == productId);
  if (existingProductIndex >= 0) {
    products[existingProductIndex].isFavourite =
        !products[existingProductIndex].isFavourite;
  }
  notifyListeners();
}
}