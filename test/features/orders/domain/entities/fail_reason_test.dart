import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';

void main() {
  test('a listed reason needs no note', () {
    expect(FailReason.customerNotAvailable.isComplete(''), isTrue);
  });

  test('Others needs a written reason', () {
    expect(FailReason.other.isComplete(''), isFalse);
    expect(FailReason.other.isComplete('   '), isFalse);
    expect(FailReason.other.isComplete('Gate locked'), isTrue);
  });
}
