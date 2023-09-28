import 'package:hablandohuevadasf/domain/domain.dart';

abstract class CardsRepository {
  Future<List<Cards>> getCards();
}
