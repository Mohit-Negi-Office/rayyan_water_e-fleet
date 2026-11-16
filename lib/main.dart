import 'package:rayyan_driver/app/app_bootstrap.dart';
import 'package:rayyan_driver/app/flavor.dart';

/// Default entry point. Uses the dev flavor, same as `main_dev.dart`.
Future<void> main() => bootstrap(flavor: AppFlavor.dev);
