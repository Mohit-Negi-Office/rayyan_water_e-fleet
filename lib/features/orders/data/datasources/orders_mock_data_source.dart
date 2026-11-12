import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/core/utils/clock.dart';
import 'package:rayyan_driver/features/orders/data/datasources/orders_mock_seed.dart';
import 'package:rayyan_driver/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:rayyan_driver/features/orders/data/models/delivery_order_model.dart';
import 'package:rayyan_driver/features/orders/data/models/order_detail_model.dart';
import 'package:rayyan_driver/features/orders/data/models/order_enums_model.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// Sample orders kept in memory, so actions show their result for the
/// rest of the session: a delivered order joins Order History and stays
/// on Home for the rest of the day, a re-assigned one leaves Home, a
/// failed one stays in today's list.
@LazySingleton(as: OrdersRemoteDataSource, env: [AppEnvironment.mock])
final class OrdersMockDataSource implements OrdersRemoteDataSource {
  OrdersMockDataSource(Clock clock) : _now = clock.now() {
    _orders = {for (final o in seedMockOrders(_now)) o.number: o};
  }

  static const Duration _latency = Duration(milliseconds: 350);
  static const String _product = 'Glass Still Water';
  static const String _productImage =
      'assets/images/mock/product_glass_still_water.png';
  static const List<int> _bottlesPerLine = [12, 4];
  static const String _customer = 'Firoz Ahmed';
  static const String _customerPhone = '+97455876543';
  static const String _recipient = 'Ahmed Al-Thani';
  static const String _listAddress = 'P.O. Box 15035, East Doha QATAR 34566';
  static const String _detailAddress =
      '24, Al-Zaeden P.O. Box 1234, Al Khor QATAR';
  static const String _instruction = 'Please Provide chilled water, Thank You';
  static const List<String> _photos = [
    'assets/images/mock/location_landmark.jpg',
    'assets/images/mock/location_building.jpg',
  ];

  /// What the API would send back as the reason.
  static const Map<FailReason, String> _failReasons = {
    FailReason.customerNotAvailable: 'Customer not available',
    FailReason.wrongAddress: 'Wrong address provided',
    FailReason.accessDenied: 'Access denied / No entry',
    FailReason.packageDamaged: 'Package damaged',
    FailReason.refusedDelivery: 'Refused delivery',
    FailReason.other: 'Others',
  };

  final DateTime _now;
  late final Map<String, MockOrder> _orders;

  @override
  Future<List<DeliveryOrderModel>> fetchOrders(OrderListScope scope) async {
    await Future<void>.delayed(_latency);
    return [
      for (final o in _orders.values)
        if (_listedIn(o, scope)) _summary(o),
    ];
  }

  /// Home also shows orders delivered or cancelled today, even after they
  /// have moved into Order History.
  bool _listedIn(MockOrder order, OrderListScope scope) {
    if (order.scope == scope) return true;
    if (scope != OrderListScope.today) return false;
    final closed = order.closedAt;
    if (closed == null) return false;
    final closedToday =
        closed.year == _now.year &&
        closed.month == _now.month &&
        closed.day == _now.day;
    if (!closedToday) return false;
    return order.status == DeliveryStatus.delivered ||
        order.status == DeliveryStatus.cancelled;
  }

  @override
  Future<OrderDetailModel> fetchOrder(String id) async {
    await Future<void>.delayed(_latency);
    return _detail(_find(id));
  }

  @override
  Future<OrderDetailModel> reassign(String id, String reason) =>
      _update(id, (o) {
        o
          ..status = DeliveryStatus.reassigned
          ..scope = OrderListScope.reassigned
          ..reason = reason;
      });

  @override
  Future<OrderDetailModel> fail(String id, FailReason reason, String note) =>
      _update(id, (o) {
        o
          ..status = DeliveryStatus.failed
          ..closedAt = _now
          ..reason = note.isEmpty ? _failReasons[reason] : note;
      });

  @override
  Future<OrderDetailModel> complete(String id, {required bool cashCollected}) =>
      _update(id, (o) {
        o
          ..status = DeliveryStatus.delivered
          ..payment = PaymentStatus.paid
          ..scope = OrderListScope.past
          ..closedAt = _now;
      });

  Future<OrderDetailModel> _update(
    String id,
    void Function(MockOrder order) change,
  ) async {
    await Future<void>.delayed(_latency);
    final order = _find(id);
    change(order);
    return _detail(order);
  }

  MockOrder _find(String id) =>
      _orders[id] ?? (throw const ServerException('Order not found'));

  DeliveryOrderModel _summary(MockOrder o) => DeliveryOrderModel(
    id: o.number,
    number: o.number,
    status: DeliveryStatusDto.fromDomain(o.status),
    outcome: o.outcome == null
        ? null
        : DeliveryStatusDto.fromDomain(o.outcome!),
    itemCount: o.quantities.fold(0, (sum, q) => sum + q),
    customerName: _recipient,
    address: _listAddress,
    paymentStatus: _payment(o.payment),
    slotStart: o.slotStart,
    slotEnd: o.slotStart.add(Duration(hours: o.slotHours)),
    closedAt: o.closedAt,
  );

  OrderDetailModel _detail(MockOrder o) => OrderDetailModel(
    id: o.number,
    number: o.number,
    status: DeliveryStatusDto.fromDomain(o.status),
    paymentStatus: _payment(o.payment),
    slotStart: o.slotStart,
    slotEnd: o.slotStart.add(Duration(hours: o.slotHours)),
    assignedAt: DateTime(_now.year, _now.month, _now.day, 5),
    items: [
      for (final (i, quantity) in o.quantities.indexed)
        OrderItemModel(
          name: _product,
          volumeMl: 750,
          bottles: _bottlesPerLine[i % _bottlesPerLine.length],
          quantity: quantity,
          imageUrl: _productImage,
        ),
    ],
    location: const DeliveryLocationModel(
      recipient: _recipient,
      address: _detailAddress,
      latitude: 25.6839,
      longitude: 51.5058,
      photoUrls: _photos,
    ),
    customerName: _customer,
    customerPhone: _customerPhone,
    totalAmount: o.totalMinor,
    specialInstruction: _instruction,
    reason: o.reason,
  );

  static PaymentStatusDto _payment(PaymentStatus payment) => switch (payment) {
    PaymentStatus.paid => PaymentStatusDto.paid,
    PaymentStatus.pending => PaymentStatusDto.pending,
  };
}
