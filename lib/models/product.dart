//class which defined properties of a product

class Product{
  final String id;
  final String category;
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  bool isFavourite;
  
  Product(
    {required this.id, 
    required this.imageUrl, 
    required this.title, 
    required this.description, 
    required this.price, 
    required this.category,
    this.isFavourite=false});
}

 