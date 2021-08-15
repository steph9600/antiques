class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageURL;
  final String productCategoryName;
  final int quantity;
  final bool isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageURL,
      required this.productCategoryName,
      required this.quantity,
      required this.isFavourite});
}
