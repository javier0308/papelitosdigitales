import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hablandohuevadasf/presentation/providers/providers.dart';
import '../presentation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(cardsProvider.notifier).loadCards();
  }

  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Papelitos Digitaltes'),
        centerTitle: true,
      ),
      body: HomeView(cards: cards),
    );
  }
}
