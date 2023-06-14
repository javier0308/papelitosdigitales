import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String firebaseKey =
      dotenv.env['THE_FIREBASE_KEY'] ?? 'no hay api key';
}
