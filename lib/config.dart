import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

abstract class BaseConfig {
  String get baseUrl => '';
}

class ProdConfig extends BaseConfig {
  @override
  String baseUrl = 'https://www.example.com/prod';
}

class DevConfig extends BaseConfig {
  @override
  String baseUrl = 'http://www.example.com/dev';
}

// final Provider<BaseConfig> configProvider = Provider<BaseConfig>((ref) {
//   const String flavorModel =
//       String.fromEnvironment('flavor', defaultValue: 'dev');

//   if (flavorModel == 'prod') {
//     return ProdConfig();
//   }
//   return DevConfig();
// });

BaseConfig getConfig() {
  const String flavorModel =
      String.fromEnvironment('flavor', defaultValue: 'dev');

  if (flavorModel == 'prod') {
    return ProdConfig();
  }
  return DevConfig();
}

void initServices() {
  sl.registerSingleton<BaseConfig>(getConfig());
}
