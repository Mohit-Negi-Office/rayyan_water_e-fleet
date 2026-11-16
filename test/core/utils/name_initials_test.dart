import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/name_initials.dart';

void main() {
  test('uses the first letter of the first and last name', () {
    expect(NameInitials.from('Mohit Nagi'), 'MN');
    expect(NameInitials.from('mohit nagi'), 'MN');
    expect(NameInitials.from('  Mohit   Nagi  '), 'MN');
  });

  test('uses the first and last word when there are more than two', () {
    expect(NameInitials.from('Mohit Kumar Nagi'), 'MN');
  });

  test('uses one letter for a single name', () {
    expect(NameInitials.from('Mohit'), 'M');
  });

  test('is empty when there is no name', () {
    expect(NameInitials.from(''), '');
    expect(NameInitials.from('   '), '');
  });
}
