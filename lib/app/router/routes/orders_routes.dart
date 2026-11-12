import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/presentation/pages/fail_delivery_page.dart';
import 'package:rayyan_driver/features/orders/presentation/pages/home_page.dart';
import 'package:rayyan_driver/features/orders/presentation/pages/order_detail_page.dart';
import 'package:rayyan_driver/features/orders/presentation/pages/orders_page.dart';

String _orderId(GoRouterState state) =>
    state.pathParameters[AppRoutes.orderIdParam] ?? '';

/// Today's orders, the Past Orders and Re-Assigned lists, and an order's
/// detail with its Fail Delivery step.
final ordersRoutes = <RouteBase>[
  GoRoute(
    name: AppRoutes.home.name,
    path: AppRoutes.home.path,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    name: AppRoutes.pastOrders.name,
    path: AppRoutes.pastOrders.path,
    builder: (context, state) => const OrdersPage(scope: OrderListScope.past),
  ),
  GoRoute(
    name: AppRoutes.reassignedOrders.name,
    path: AppRoutes.reassignedOrders.path,
    builder: (context, state) =>
        const OrdersPage(scope: OrderListScope.reassigned),
  ),
  GoRoute(
    name: AppRoutes.orderDetail.name,
    path: AppRoutes.orderDetail.path,
    builder: (context, state) => OrderDetailPage(orderId: _orderId(state)),
  ),
  GoRoute(
    name: AppRoutes.failDelivery.name,
    path: AppRoutes.failDelivery.path,
    builder: (context, state) => FailDeliveryPage(orderId: _orderId(state)),
  ),
];
