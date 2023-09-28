// To parse this JSON data, do
//
//     final cardsResponse = cardsResponseFromJson(jsonString);

import 'dart:convert';

Map<String, CardsResponse> cardsResponseFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, CardsResponse>(k, CardsResponse.fromJson(v)));

String cardsResponseToJson(Map<String, CardsResponse> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class CardsResponse {
  String foto;
  String name;
  String? id;

  CardsResponse({
    required this.foto,
    required this.name,
    this.id,
  });

  factory CardsResponse.fromJson(String str) =>
      CardsResponse.fromMap(json.decode(str));

  factory CardsResponse.fromMap(Map<String, dynamic> json) => CardsResponse(
        foto: json["foto"],
        name: json["name"],
      );
}
