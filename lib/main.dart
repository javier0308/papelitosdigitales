import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hablandohuevadasf/provider/form_provider.dart';
import 'package:hablandohuevadasf/provider/fotos_provider.dart';
import 'package:hablandohuevadasf/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hablandohuevadasf/service/merch_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initialization();
  runApp(const MyApp());
}

Future<void> initialization() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FormStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SwiperPictures(),
        ),
        ChangeNotifierProvider(
          create: (context) => MerchService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red[800],
        ),
        debugShowCheckedModeBanner: false,
        title: 'Papelitos Digitales',
        home: const HomeScreen(),
      ),
    );
  }
}
