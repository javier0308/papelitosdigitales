import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hablandohuevadasf/config/config.dart';

// final adInterstitialProvider = FutureProvider<InterstitialAd>((ref) async {
//   final ad = await AdmobPlugin.loadInterstitialAd();
//   return ad;
// });

final interstitialAdProvider =
    StateNotifierProvider<InterstitialAdNotifier, InterstitialState>((ref) {
  return InterstitialAdNotifier(AdmobPlugin.loadInterstitialAd);
});

typedef AdInterstitalCallback = Future<InterstitialAd> Function();

class InterstitialAdNotifier extends StateNotifier<InterstitialState> {
  final AdInterstitalCallback adInterstitalCallback;
  InterstitialAdNotifier(this.adInterstitalCallback)
      : super(InterstitialState());

  Future<void> createInterstital() async {
    final ad = await adInterstitalCallback();
    state = state.copyWith(interstitialAd: ad);
  }

  void showInterstital() {
    final ad = state.interstitialAd;
    if (ad == null) return;
    ad.show();
  }
}

class InterstitialState {
  final InterstitialAd? interstitialAd;

  InterstitialState({
    this.interstitialAd,
  });

  InterstitialState copyWith({
    // bool? isLoading,
    InterstitialAd? interstitialAd,
  }) =>
      InterstitialState(
        // isLoading: isLoading ?? this.isLoading,
        interstitialAd: interstitialAd ?? this.interstitialAd,
      );
}
