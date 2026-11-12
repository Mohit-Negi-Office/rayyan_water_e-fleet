/// Reasons offered on "Fail Delivery" (Figma `5672:39363`).
enum FailReason {
  customerNotAvailable,
  wrongAddress,
  accessDenied,
  packageDamaged,
  refusedDelivery,

  /// "Others": the driver writes the reason.
  other;

  /// Whether the reason can be sent with [note].
  bool isComplete(String note) => this != other || note.trim().isNotEmpty;
}
