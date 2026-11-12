import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/app/router/app_redirect.dart';

void main() {
  String? resolve(String location, {required bool signedIn}) =>
      AppRedirect.resolve(isAuthenticated: signedIn, uri: Uri.parse(location));

  group('signed out', () {
    test('the splash and login stay open', () {
      expect(resolve('/', signedIn: false), isNull);
      expect(resolve('/login', signedIn: false), isNull);
      expect(
        resolve('/login/otp?phone=%2B97455876543', signedIn: false),
        isNull,
      );
    });

    test('policy pages stay open so login can open them', () {
      expect(resolve('/support/policies/terms', signedIn: false), isNull);
      expect(resolve('/support/policies/privacy', signedIn: false), isNull);
    });

    test('every other screen goes to login', () {
      for (final path in [
        '/home',
        '/orders/past',
        '/orders/123',
        '/orders/123/fail',
        '/profile',
        '/support/faqs',
        '/support/policies',
        '/support/policies/terms/extra',
      ]) {
        expect(resolve(path, signedIn: false), '/login', reason: path);
      }
    });
  });

  group('signed in', () {
    test('login screens go to Home', () {
      expect(resolve('/login', signedIn: true), '/home');
      expect(resolve('/login/otp', signedIn: true), '/home');
    });

    test('app screens stay put', () {
      expect(resolve('/home', signedIn: true), isNull);
      expect(resolve('/orders/123', signedIn: true), isNull);
      expect(resolve('/support/policies/terms', signedIn: true), isNull);
      expect(resolve('/', signedIn: true), isNull);
    });

    test('a path that only starts like login is not login', () {
      expect(resolve('/loginx', signedIn: false), '/login');
    });
  });
}
