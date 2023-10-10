import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hablandohuevadasf/config/config.dart';

import '../../presentation/providers/providers.dart';

class BannerSwiper extends ConsumerStatefulWidget {
  const BannerSwiper({super.key});

  @override
  BannerSwiperState createState() => BannerSwiperState();
}

class BannerSwiperState extends ConsumerState<BannerSwiper> {
  @override
  void initState() {
    super.initState();
    ref.read(cardsProvider.notifier).loadCards();
  }

  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardsProvider);
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
      ],
    );

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
        viewportFraction: 0.85,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: primaryColor,
            color: Colors.grey,
          ),
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: DecoratedBox(
                decoration: decoration,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(card.foto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
