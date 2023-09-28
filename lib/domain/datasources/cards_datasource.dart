import 'package:hablandohuevadasf/domain/domain.dart';

abstract class CardsDataSource {
  Future<List<Cards>> getCards();
}
