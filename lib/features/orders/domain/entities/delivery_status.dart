/// Where an order stands for the driver.
enum DeliveryStatus {
  /// Assigned, not picked up yet.
  newOrder,

  /// Loaded on the vehicle.
  orderPicked,

  /// At the customer's address.
  dropOff,
  delivered,
  cancelled,
  failed,

  /// Handed to another driver.
  reassigned;

  /// Still the driver's to deliver.
  bool get isActive => switch (this) {
    newOrder || orderPicked || dropOff => true,
    delivered || cancelled || failed || reassigned => false,
  };

  /// Picked up and on the way to the customer.
  bool get isOnTheWay => this == orderPicked || this == dropOff;
}
