import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hablandohuevadasf/domain/domain.dart';
import 'package:hablandohuevadasf/infraestructure/infraestructure.dart';

final cardsRepositoryProvider = Provider<CardsRepository>(
  (ref) {
    return CardsRepositoryImpl(
      CardsDataSourceImpl(),
    );
  },
);
