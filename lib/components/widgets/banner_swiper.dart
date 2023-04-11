import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/fotos_provider.dart';

class BannerSwiper extends StatelessWidget {
  const BannerSwiper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fotosServices = Provider.of<SwiperPictures>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      width: double.infinity,
      child: Swiper(
        onTap: (index) async {
          final fotos = fotosServices.fotos[index];
          final Uri url = Uri.parse(fotos.name);

          if (!await launchUrl(url)) {
            throw 'No se pudo lanzar el $url';
          }
        },
        scale: 0.9,
        viewportFraction: 0.8,
        autoplay: true,
        itemCount: fotosServices.fotos.length,
        itemBuilder: (context, index) {
          final fotos = fotosServices.fotos[index];
          return FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(fotos.foto),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
