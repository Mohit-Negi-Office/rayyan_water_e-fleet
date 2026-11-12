# 05 · Navigation — go_router Only

## 1. Hard rules

1. All navigation goes through **`go_router`**.
2. **Never** use `Navigator.push(context, MaterialPageRoute(...))`, `Navigator.pushNamed`, or inline
   `PageRouteBuilder` in the UI layer.
3. Route paths and names are defined **once** as constants — no string literals at call sites.
4. Blocs/Cubits never navigate. Navigation is triggered from the UI (`BlocListener`) in response to state.
5. `Navigator.pop` is replaced by `context.pop()`. Dialogs/bottom sheets may use `showDialog` /
   `showModalBottomSheet` (they are overlays, not routes) and close with `context.pop()`.

## 2. Structure

```
lib/app/router/
├── app_router.dart        # GoRouter instance, redirect logic, error page
├── app_routes.dart        # route names & paths (constants)
└── routes/                # one file per feature's GoRoute list (keeps each file < 250 lines)
    ├── auth_routes.dart
    ├── home_routes.dart
    └── orders_routes.dart
```

```dart
// lib/app/router/app_routes.dart
abstract final class AppRoutes {
  static const splash = (name: 'splash', path: '/');
  static const language = (name: 'language', path: '/language');
  static const login = (name: 'login', path: '/login');
  static const otp = (name: 'otp', path: '/login/otp');
  static const home = (name: 'home', path: '/home');
  static const products = (name: 'products', path: '/products');
  static const productDetail = (name: 'productDetail', path: '/product/:productId'); // sheet above any tab
  static const search = (name: 'search', path: '/search');
  static const favourites = (name: 'favourites', path: '/favourites');
  static const profile = (name: 'profile', path: '/profile');
  static const orders = (name: 'orders', path: 'orders');                 // child of profile
  static const orderDetail = (name: 'orderDetail', path: ':orderId');      // child of orders
  static const cart = (name: 'cart', path: '/cart');
  static const checkout = (name: 'checkout', path: '/checkout');
  static const orderPlaced = (name: 'orderPlaced', path: '/checkout/placed/:orderId');
  static const notifications = (name: 'notifications', path: '/notifications');
  static const addresses = (name: 'addresses', path: '/addresses');
  static const addressMap = (name: 'addressMap', path: 'map');                // child of addresses
  static const addressNew = (name: 'addressNew', path: 'new');                // child of addresses
  static const addressEdit = (name: 'addressEdit', path: ':addressId/edit'); // child of addresses
  // Query parameters: category (Products tab), lat / lng (map, new address), pick (map returns
  // the confirmed place to the address form), from (login return).
  // Extend from 11_FEATURES_AND_SCREENS.md as screens are built. No Rider App routes.
}
```

```dart
// lib/app/router/routes/orders_routes.dart
final ordersRoutes = <RouteBase>[
  GoRoute(
    name: AppRoutes.orders.name,
    path: AppRoutes.orders.path,
    builder: (context, state) => const OrdersPage(),
    routes: [
      GoRoute(
        name: AppRoutes.orderDetail.name,
        path: AppRoutes.orderDetail.path,
        builder: (context, state) =>
            OrderDetailPage(orderId: state.pathParameters['orderId']!),
      ),
    ],
  ),
];
```

## 3. Navigating

```dart
context.goNamed(AppRoutes.home.name);                                   // replace stack
context.pushNamed(AppRoutes.orderDetail.name,
    pathParameters: {'orderId': order.id});                             // push on stack
context.pop();                                                          // back
```

- Pass **IDs** via `pathParameters`/`queryParameters`; the destination page loads its own data through its Cubit.
- Use `extra` only for non-serialisable, non-deep-linkable data — and always handle it being `null` (e.g. after app restore or deep link).

## 4. Bottom navigation / tabs

The design's bottom bar has four tabs and a centre cart button:
**Home · Products · [Cart FAB] · Favourite · Profile**.

- Use `StatefulShellRoute.indexedStack` with **four branches** (`home`, `products`, `favourites`, `profile`) so each tab keeps its own stack and scroll position.
- The centre **Cart** button is **not** a branch: it pushes `AppRoutes.cart` above the shell (full-screen, no bottom bar), followed by checkout.
- The shell scaffold (`AppShellScaffold` + `AppBottomNav`) lives in `lib/app/router/` or `core/widgets/`, not inside a feature. The cart badge reads an app-scoped `CartSummaryCubit`.

Guest vs logged-in: browsing, cart and choosing a delivery location on the map work for guests; the
redirect sends guests to `login` only when entering `checkout` or account-only screens (orders, saving or
editing an address, saved cards, rewards, profile edit), then returns them to the original location via a
`from` query parameter. Use `context.pushLogin()` (`login_navigation_x.dart`) for in-page Login buttons.

Above the shell: `notifications`, `search`, `productDetail` (a `ModalSheetPage`, so it is a real route
that pops like a sheet), `addresses` with its children, `cart`, `checkout`. Each list lives in
`lib/app/router/routes/*_routes.dart`.

## 5. Auth & redirects

- `redirect` in `app_router.dart` reads the auth state from an app-scoped `AuthCubit` exposed via a
  `refreshListenable` (`GoRouterRefreshStream(authCubit.stream)`).
- Redirect logic is a **pure function** of (auth state, location) → tested with unit tests.

## 6. Deep links & errors

- Every route must be reachable by its path (deep-link safe): pages must not depend on a previous page's state.
- Provide `errorBuilder` → a themed `NotFoundPage`.

## 7. Testing

- Unit-test `redirect`.
- Widget-test navigation by pumping `MaterialApp.router` with a test `GoRouter` and asserting the rendered page after a tap.
