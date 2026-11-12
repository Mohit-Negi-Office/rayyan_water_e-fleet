import 'package:url_launcher/url_launcher.dart';

/// Opens the phone dialler and maps. Each returns false when nothing on
/// the device can handle the link.
abstract final class ExternalLinks {
  static Future<bool> call(String phone) =>
      launchUrl(Uri(scheme: 'tel', path: phone));

  /// Turn-by-turn directions to a point, or to [address] when there are no
  /// coordinates.
  static Future<bool> directions({
    double? latitude,
    double? longitude,
    String? address,
  }) {
    final destination = latitude != null && longitude != null
        ? '$latitude,$longitude'
        : address ?? '';
    final uri = Uri.https('www.google.com', '/maps/dir/', {
      'api': '1',
      'destination': destination,
    });
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
