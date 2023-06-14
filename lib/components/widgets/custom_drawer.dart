import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../service/merch_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final merch = Provider.of<MerchService>(context).merch;
    return Drawer(
      width: 330,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              forceElevated: false,
              backgroundColor: Colors.white,
              floating: true,
              expandedHeight: 150,
              flexibleSpace: Image.asset('assets/hh.png'),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    children: List.generate(
                      merch.length,
                      (i) {
                        final merchs = merch[i];
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(4, 4),
                                  blurRadius: 12),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    placeholder:
                                        const AssetImage('assets/no-image.png'),
                                    image: NetworkImage(merchs.image),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text(
                                      merchs.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'S/${merchs.price.toDouble().toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 22,
                                      child: merchs.status
                                          ? Bounce(
                                              infinite: true,
                                              from: 5,
                                              delay: Duration(
                                                  milliseconds: 300 * i),
                                              child: FilledButton(
                                                style: FilledButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                ),
                                                onPressed: () async {
                                                  final url =
                                                      Uri.parse(merchs.url);
                                                  if (!await launchUrl(url)) {
                                                    throw 'No se pudo lanzar el $url';
                                                  }
                                                },
                                                child: const Text(
                                                  'COMPRAR',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : FilledButton(
                                              onPressed: () {},
                                              style: FilledButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              child: const Text(
                                                'AGOTADO',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
