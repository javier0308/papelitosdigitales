// To parse this JSON data, do
//

import 'dart:convert';

class CardsResponse {
  String foto;
  String name;
  String? id;

  CardsResponse({
    required this.foto,
    required this.name,
  });

  factory CardsResponse.fromJson(String str) =>
      CardsResponse.fromMap(json.decode(str));

  factory CardsResponse.fromMap(Map<String, dynamic> json) => CardsResponse(
        foto: json["foto"],
        name: json["name"],
      );
}
