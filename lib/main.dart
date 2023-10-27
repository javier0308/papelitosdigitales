import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hablandohuevadasf/config/config.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await AdmobPlugin.initialize();
  await DotEnvPlugin.loadEnv();
  await Firebase.initializeApp();

  NativeSplash.preserverSplash(widgetsBinding);
  NativeSplash.initializcionSplah();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Papelitos Digitales',
      routerConfig: appRoutes,
    );
  }
}
