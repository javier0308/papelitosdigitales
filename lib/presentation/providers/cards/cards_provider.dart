import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hablandohuevadasf/domain/domain.dart';
import 'cards_repository_provider.dart';

typedef CardsCallBack = Future<List<Cards>> Function();

class CardsNotifier extends StateNotifier<List<Cards>> {
  final CardsCallBack cardsCallBack;

  CardsNotifier(this.cardsCallBack) : super([]);
  Future<void> loadCards() async {
    final List<Cards> cards = await cardsCallBack();
    state = [...state, ...cards];
  }
}

final cardsProvider = StateNotifierProvider<CardsNotifier, List<Cards>>((ref) {
  final cardsCallback = ref.watch(cardsRepositoryProvider);
  return CardsNotifier(cardsCallback.getCards);
});
