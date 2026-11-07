class Product {
  final String name;
  final double price;
  final String image;
  final String description;
  final double rating;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    this.rating = 4.9,
  });
}