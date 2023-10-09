import 'package:hablandohuevadasf/domain/domain.dart';
import 'package:hablandohuevadasf/infraestructure/infraestructure.dart';

class CardsMapper {
  static Cards cardsToEntity(CardsResponse cardsDb) => Cards(
        foto: cardsDb.foto,
        name: cardsDb.name,
      );
}
