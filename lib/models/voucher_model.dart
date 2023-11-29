// To parse this JSON data, do
//
//     final voucherResponseModel = voucherResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VoucherResponseModel voucherResponseModelFromJson(String str) => VoucherResponseModel.fromJson(json.decode(str));

String voucherResponseModelToJson(VoucherResponseModel data) => json.encode(data.toJson());

class VoucherResponseModel {
  List<Menu> menu;

  VoucherResponseModel({
    required this.menu,
  });

  factory VoucherResponseModel.fromJson(Map<String, dynamic> json) => VoucherResponseModel(
    menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
  };
}

class Menu {
  int id;
  String name;
  String image;
  String limit;
  String discount;

  Menu({
    required this.id,
    required this.name,
    required this.image,
    required this.limit,
    required this.discount,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    limit: json["limit"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "limit": limit,
    "discount": discount,
  };
}
