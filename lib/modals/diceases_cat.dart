import 'package:flutter/foundation.dart';

class diceases_catagory {
  static List<Category> categories = [];
}

class Category {
  final String name;
  final String info;
  final String image;
  final String logo;

  Category({
    required this.name,
    required this.info,
    required this.image,
    required this.logo,
  });

  factory Category.fromjson(Map<String, dynamic> map) {
    return Category(
        name: map["name"],
        info: map["info"],
        image: map["image"],
        logo: map["logo"]);
  }
}
