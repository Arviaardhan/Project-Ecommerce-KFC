// To parse this JSON data, do
//
//     final kfcResponseModel = kfcResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KfcResponseModel kfcResponseModelFromJson(String str) => KfcResponseModel.fromJson(json.decode(str));

String kfcResponseModelToJson(KfcResponseModel data) => json.encode(data.toJson());

class KfcResponseModel {
  List<Menu> menu;

  KfcResponseModel({
    required this.menu,
  });

  factory KfcResponseModel.fromJson(Map<String, dynamic> json) => KfcResponseModel(
    menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
  };
}

class Menu {
  int id;
  String name;
  double price;
  int drink;
  int rice;
  Category category;
  String image;
  List<String> food;

  var description;

  Menu({
    required this.id,
    required this.name,
    required this.price,
    required this.drink,
    required this.rice,
    required this.category,
    required this.image,
    required this.food,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["id"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    drink: json["drink"],
    rice: json["rice"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    food: List<String>.from(json["food"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "drink": drink,
    "rice": rice,
    "category": categoryValues.reverse[category],
    "image": image,
    "food": List<dynamic>.from(food.map((x) => x)),
  };
}

enum Category {
  ALACARTE,
  COMBO,
  SPECIAL
}

final categoryValues = EnumValues({
  "Alacarte": Category.ALACARTE,
  "Combo": Category.COMBO,
  "Special": Category.SPECIAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
