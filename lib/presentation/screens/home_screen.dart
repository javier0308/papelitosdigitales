import 'package:flutter/material.dart';

import '../presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Papelitos Digitaltes'),
        centerTitle: true,
      ),
      body: const HomeView(),
    );
  }
}
