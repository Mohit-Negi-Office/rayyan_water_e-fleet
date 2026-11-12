import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/app/di/injection.config.dart';

/// Global service locator. Only pages, the router and `main` read from it.
final GetIt getIt = GetIt.instance;

/// Registers every `@injectable` dependency for [environment].
@InjectableInit()
Future<void> configureDependencies({String? environment}) =>
    getIt.init(environment: environment ?? AppEnvironment.current);
