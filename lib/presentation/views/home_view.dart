import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/presentation/presentation.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      // padding: EdgeInsets.all(10),
      child: Column(
        children: [
          BannerSwiper(),
          SizedBox(height: 20),
          FormsPapers(),
        ],
      ),
    );
  }
}
