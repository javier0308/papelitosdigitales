import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/domain/domain.dart';

class HomeView extends StatelessWidget {
  final List<Cards> cards;
  const HomeView({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      width: double.infinity,
      child: Swiper(
        onTap: (index) async {
          // final fotos = fotosServices.fotos[index];
          // final Uri url = Uri.parse(fotos.name);

          // if (!await launchUrl(url)) {
          //   throw 'No se pudo lanzar el $url';
          // }
        },
        scale: 0.9,
        viewportFraction: 0.8,
        autoplay: true,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];

          return FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(card.foto),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
