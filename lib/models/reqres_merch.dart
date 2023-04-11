import 'dart:convert';

class Merch {
  Merch({
    required this.image,
    required this.name,
    required this.price,
    required this.status,
    required this.url,
  });

  String image;
  String name;
  int price;
  bool status;
  String url;
  String? id;

  factory Merch.fromJson(String str) => Merch.fromMap(json.decode(str));

  factory Merch.fromMap(Map<String, dynamic> json) => Merch(
        image: json["image"],
        name: json["name"],
        price: json["price"],
        status: json["status"],
        url: json["url"],
      );
}
