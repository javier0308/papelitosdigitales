import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/config/constants/environment.dart';
import 'package:hablandohuevadasf/models/reqres_merch.dart';
import 'package:http/http.dart' as http;

class MerchService extends ChangeNotifier {
  final String _baseUrl = Environment.firebaseKey;
  final List<Merch> merch = [];

  MerchService() {
    getMerch();
  }

  Future<List<Merch>> getMerch() async {
    final url = Uri.https(_baseUrl, 'merch.json');
    final resp = await http.get(url);
    final Map<String, dynamic> merchMap = json.decode(resp.body);
    merchMap.forEach((key, value) {
      final tempMerch = Merch.fromMap(value);
      tempMerch.id = key;
      merch.add(tempMerch);
    });
    notifyListeners();
    return merch;
  }
}
