import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/orders/data/models/delivery_order_model.dart';
import 'package:rayyan_driver/features/orders/data/models/order_detail_model.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_actions.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

import '../../../helpers/fixture.dart';

void main() {
  group('OrderDetailModel', () {
    test('reads the detail and maps it to the entity', () {
      final order = OrderDetailModel.fromJson(
        fixture('order_detail.json'),
      ).toEntity();
      expect(order.status, DeliveryStatus.dropOff);
      expect(order.payment, PaymentStatus.pending);
      expect(order.itemCount, 3);
      expect(order.items.first.bottles, 12);
      expect(order.location.photoUrls, hasLength(1));
      expect(order.totalMinor, 17000);
      expect(order.actions.completion, DeliveryCompletion.collectCash);
    });

    test('round-trips through JSON', () {
      final json = fixture('order_detail.json');
      expect(
        OrderDetailModel.fromJson(json).toJson()['status'],
        json['status'],
      );
    });
  });

  group('DeliveryOrderModel', () {
    Map<String, dynamic> json(String status) => {
      'id': '1',
      'number': '71864586927',
      'status': status,
      'item_count': 3,
      'customer_name': 'Ahmed Al-Thani',
      'address': 'P.O. Box 15035',
    };

    test('reads a re-assigned order', () {
      final order = DeliveryOrderModel.fromJson(json('reassigned')).toEntity();
      expect(order.status, DeliveryStatus.reassigned);
      expect(order.payment, isNull);
    });

    test('an unknown status is shown closed, never actionable', () {
      final order = DeliveryOrderModel.fromJson(json('teleported')).toEntity();
      expect(order.status, DeliveryStatus.cancelled);
      expect(order.status.isActive, isFalse);
    });
  });
}
