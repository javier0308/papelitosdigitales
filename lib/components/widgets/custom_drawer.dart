import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/models/reqres_merch.dart';

import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  final List<Merch> outfits;
  const CustomDrawer({
    Key? key,
    required this.outfits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Poleras',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    children: List.generate(
                      outfits.sublist(8, 14).length,
                      (i) {
                        final merchs = outfits.sublist(8, 14)[i];
                        return _MerchCard(
                          merchs: merchs,
                          index: i,
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Polos',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    children: List.generate(
                      outfits.sublist(0, 7).length,
                      (i) {
                        final merchs = outfits.sublist(0, 7)[i];
                        return _MerchCard(
                          merchs: merchs,
                          index: i,
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Otros Productos',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    children: List.generate(
                      outfits.sublist(14, 18).length,
                      (i) {
                        final merchs = outfits.sublist(14, 18)[i];
                        return _MerchCard(
                          merchs: merchs,
                          index: i,
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Lanyards',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    children: List.generate(
                      outfits.sublist(18, 22).length,
                      (i) {
                        final merchs = outfits.sublist(18, 22)[i];
                        return _MerchCard(
                          merchs: merchs,
                          index: i,
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

class _MerchCard extends StatelessWidget {
  const _MerchCard({
    required this.merchs,
    required this.index,
  });

  final Merch merchs;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                placeholder: const AssetImage('assets/no-image.png'),
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'S/${merchs.price.toDouble().toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
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
                          delay: Duration(milliseconds: 300 * index),
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () async {
                              final url = Uri.parse(merchs.url);
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
  }
}
