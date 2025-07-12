class Product {
  final String title;
  final String image;
  final int price;
  final int? discount;
  final String category;

  Product({
    required this.title,
    required this.image,
    required this.price,
    this.discount,
    required this.category,
  });
}
