import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hablandohuevadasf/config/config.dart';
import 'package:hablandohuevadasf/presentation/providers/providers.dart';

class FormsPapers extends ConsumerStatefulWidget {
  const FormsPapers({super.key});

  @override
  FormsPapersState createState() => FormsPapersState();
}

class FormsPapersState extends ConsumerState<FormsPapers> {
  final titleController = TextEditingController();
  final paperController = TextEditingController();
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    // ref.read(interstitialAdProvider.notifier).createInterstital();
    super.initState();
    MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
        testDeviceIds: ['0C2EE5EBAD2212AEFCD7CA1E09ADC957']));
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // print('$ad loaded');
            _interstitialAd = ad;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            // print('InterstitialAd failed to load: $error.');

            _interstitialAd = null;
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      // print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        // print('ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        // print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        // print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  void dispose() {
    titleController.dispose();
    paperController.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paperForm = ref.watch(paperFormProvider);

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      counterStyle: const TextStyle(fontSize: 15),
      floatingLabelStyle: const TextStyle(
          color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      labelText: 'Nombre',
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      border: InputBorder.none,
      errorText: paperForm.isFormPosting ? paperForm.title.errorMessage : null,
    );
    final inputDecoration2 = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      counterStyle: const TextStyle(fontSize: 15),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelText: 'Papelito',
      errorText: paperForm.isFormPosting ? paperForm.paper.errorMessage : null,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      border: InputBorder.none,
    );
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TextFormField(
            maxLength: 15,
            cursorColor: primaryColor,
            textCapitalization: TextCapitalization.words,
            controller: titleController,
            enabled: !paperForm.isPosting,
            onChanged: ref.read(paperFormProvider.notifier).onTitleChanged,
            style: const TextStyle(fontSize: 15),
            decoration: inputDecoration,
          ),
          const SizedBox(height: 5),
          TextFormField(
            maxLength: 250,
            cursorColor: primaryColor,
            controller: paperController,
            style: const TextStyle(fontSize: 15),
            enabled: !paperForm.isPosting,
            onChanged: ref.read(paperFormProvider.notifier).onPaperChanged,
            maxLines: 5,
            decoration: inputDecoration2,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: paperForm.isPosting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    ref.read(paperFormProvider.notifier).onFormSubmit();
                    // if (interstitalAdAsync.hasValue) {
                    //   interstitalAdAsync.value?.show();
                    // }
                    _showInterstitialAd();
                    // ref.read(interstitialAdProvider.notifier).showInterstital();
                    // alertQuick(context);
                    titleController.clear();
                    paperController.clear();
                  },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.065,
              child: Center(
                child: Text(
                  paperForm.isFormPosting ? 'Enviado' : 'Enviar',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 50)
        ],
      ),
    );
  }
}
