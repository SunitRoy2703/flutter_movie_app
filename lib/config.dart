import 'package:flutter_riverpod/all.dart';

class Config{
  final movieApiKey = const String.fromEnvironment("28b49153f4a4084b2eb743f0ef6f7ed3");
}

final configProvider = Provider<Config>((ref){
  return Config();
});