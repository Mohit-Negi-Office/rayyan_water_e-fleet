import 'package:equatable/equatable.dart';

/// The static pages under "Support & More".
enum PolicyType { aboutUs, terms, privacy }

/// One heading and its text; the first section may have no heading.
final class PolicySection extends Equatable {
  const PolicySection({required this.body, this.heading});

  final String? heading;
  final String body;

  @override
  List<Object?> get props => [heading, body];
}

/// A policy page ("Last Updated October 2026" and its sections), already
/// in the app language.
final class PolicyDocument extends Equatable {
  const PolicyDocument({
    required this.type,
    required this.updatedAt,
    required this.sections,
  });

  final PolicyType type;
  final DateTime updatedAt;
  final List<PolicySection> sections;

  @override
  List<Object?> get props => [type, updatedAt, sections];
}
