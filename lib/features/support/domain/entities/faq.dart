import 'package:equatable/equatable.dart';

/// One of the "Frequently asked questions".
final class Faq extends Equatable {
  const Faq({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  List<Object?> get props => [question, answer];
}
