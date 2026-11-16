/// Build target chosen by the entry point.
///
/// `lib/main.dart` and `lib/main_dev.dart` use [dev]. QA, staging, and
/// production have their own entry points.
enum AppFlavor { dev, qa, staging, production }
