import 'package:envied/envied.dart';

part 'env.g.dart';

/// Values from the active `.env`, copied from `.env.dev`, `.env.qa`,
/// `.env.staging`, or `.env.prod` before codegen.
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static String baseUrl = _Env.baseUrl;
}
