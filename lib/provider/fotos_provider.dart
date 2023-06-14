import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/config/constants/environment.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/reqres_swiper.dart';

class SwiperPictures extends ChangeNotifier {
  final String _baseUrl = Environment.firebaseKey;
  final List<Fotos> fotos = [];

  SwiperPictures() {
    loadFotos();
  }
  Future<List<Fotos>> loadFotos() async {
    final url = Uri.https(_baseUrl, 'swiper.json');
    final resp = await http.get(url);
    final Map<String, dynamic> fotosMap = json.decode(resp.body);
    fotosMap.forEach((key, value) {
      final tempFotos = Fotos.fromMap(value);
      tempFotos.id = key;
      fotos.add(tempFotos);
    });

    notifyListeners();

    return fotos;
  }
}
