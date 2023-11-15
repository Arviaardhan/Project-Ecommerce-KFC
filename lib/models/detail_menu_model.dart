import 'dart:convert';

List<MenuKFC> menuKFCFromJson(String str) =>
    List<MenuKFC>.from(json.decode(str).map((x) => MenuKFC.fromJson(x)));

String menuKFCToJson(List<MenuKFC> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuKFC {
  MenuKFC({
    required this.id,
    required this.name,
    required this.price,
    required this.drink,
    required this.rice,
    required this.category,
    required this.image,
    required this.food,
  });

  int id;
  String name;
  double price;
  int drink;
  int rice;
  String category;
  String image;
  List<String> food;

  factory MenuKFC.fromJson(Map<String, dynamic> json) => MenuKFC(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        drink: json["drink"],
        rice: json["rice"],
        category: json["category"],
        image: json["image"],
        food: List<String>.from(json["food"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "drink": drink,
        "rice": rice,
        "category": category,
        "image": image,
        "food": List<dynamic>.from(food.map((x) => x)),
      };
}