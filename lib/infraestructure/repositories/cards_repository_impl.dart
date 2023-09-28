import 'package:hablandohuevadasf/domain/domain.dart';

class CardsRepositoryImpl extends CardsRepository {
  final CardsDataSource dataSource;

  CardsRepositoryImpl(this.dataSource);
  @override
  Future<List<Cards>> getCards() => dataSource.getCards();
}
