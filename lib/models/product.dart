class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final List<String> images;
  late int qty;

  Product({
    required this.id,
    required this.qty,
    required this.name,
    required this.price,
    required this.description,
    required this.images,
  });
}