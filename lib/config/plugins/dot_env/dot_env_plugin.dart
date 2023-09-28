import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvPlugin {
  static Future<void> loadEnv() async {
    dotenv.load(fileName: '.env');
  }
}
