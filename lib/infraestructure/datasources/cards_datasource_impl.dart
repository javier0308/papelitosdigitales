import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hablandohuevadasf/config/config.dart';
import 'package:hablandohuevadasf/domain/domain.dart';

import 'package:hablandohuevadasf/infraestructure/models/cards_response.dart';

class CardsDatasourceImpl extends CardsDataSource {
  final Dio dio;

  CardsDatasourceImpl()
      : dio = Dio(BaseOptions(baseUrl: Environment.firebaseKey));
  @override
  Future<List<Cards>> getCards() async {
    final response = await dio.get('/swiper.json');
    final Map<String, dynamic> cardsMap = json.decode(response.data);
    final List<Cards> cards = [];
    cardsMap.forEach((key, value) {
      final tempCards = CardsResponse.fromMap(value);
      tempCards.id = key;
      cards.add(value);
    });

    return cards;
  }
}
