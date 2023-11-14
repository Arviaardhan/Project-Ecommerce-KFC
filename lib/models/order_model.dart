class OrderModel {
  final String name;
  final List<String> food;
  final String image;
  final double? price;
  int quantity;

  OrderModel({
    required this.name,
    required this.food,
    required this.image,
    this.price,
    this.quantity = 1,
  });
}