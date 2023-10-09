import 'dart:convert';

import 'package:hablandohuevadasf/config/config.dart';
import 'package:hablandohuevadasf/domain/domain.dart';
import 'package:hablandohuevadasf/infraestructure/infraestructure.dart';
import 'package:http/http.dart' as http;

class CardsDataSourceImpl extends CardsDataSource {
  final String baseUrl = Environment.firebaseKey;
  final List<Cards> cards = [];

  @override
  Future<List<Cards>> getCards() async {
    try {
      final url = Uri.https(baseUrl, 'swiper.json');
      final resp = await http.get(url);
      final Map<String, dynamic> cardsMap = json.decode(resp.body);

      cardsMap.forEach((key, value) {
        final tempCard = CardsResponse.fromMap(value);
        tempCard.id = key;

        cards.add(CardsMapper.cardsToEntity(tempCard));
      });
      return cards;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
