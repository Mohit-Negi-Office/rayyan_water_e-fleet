import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';

/// Alice HTTP inspector used by dev and staging builds.
abstract final class ApiLogInspector {
  /// Inspector with the shake gesture and status notification turned off.
  /// The app opens it from the "Open logs" chip.
  static Alice create() {
    return Alice(
      configuration: AliceConfiguration(
        showNotification: false,
        showInspectorOnShake: false,
      ),
    );
  }

  /// Records Dio traffic when [enabled] and [alice] are both set.
  static void attach(Dio dio, {required bool enabled, Alice? alice}) {
    if (!enabled || alice == null) return;
    final adapter = AliceDioAdapter();
    alice.addAdapter(adapter);
    dio.interceptors.add(adapter);
  }

  /// Opens the inspector and returns immediately if it is already open.
  static Future<void> open(Alice alice) async {
    if (alice.isInspectorOpened) return;
    alice.showInspector();
  }
}
