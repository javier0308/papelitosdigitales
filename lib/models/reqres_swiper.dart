// To parse this JSON data, do
//
//     final fotos = fotosFromMap(jsonString);

import 'dart:convert';

class Fotos {
  Fotos({
    required this.foto,
    required this.name,
  });

  String foto;
  String name;
  String? id;

  factory Fotos.fromJson(String str) => Fotos.fromMap(json.decode(str));

  factory Fotos.fromMap(Map<String, dynamic> json) => Fotos(
        foto: json["foto"],
        name: json["name"],
      );
}
