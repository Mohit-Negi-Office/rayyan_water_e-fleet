import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';
import 'package:rayyan_driver/features/support/domain/usecases/support_usecases.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/faqs_cubit.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/faqs_state.dart';

class _MockGetFaqs extends Mock implements GetFaqs {}

const _faqs = [
  Faq(question: 'Q1', answer: 'A1'),
  Faq(question: 'Q2', answer: 'A2'),
];

void main() {
  late _MockGetFaqs getFaqs;

  setUpAll(() => registerFallbackValue(const NoParams()));
  setUp(() => getFaqs = _MockGetFaqs());

  blocTest<FaqsCubit, FaqsState>(
    'loads with the first question open',
    build: () {
      when(() => getFaqs(any())).thenAnswer((_) async => const Success(_faqs));
      return FaqsCubit(getFaqs);
    },
    act: (cubit) => cubit.load(),
    expect: () => const [
      FaqsState.loading(),
      FaqsState.loaded(_faqs, expanded: 0),
    ],
  );

  blocTest<FaqsCubit, FaqsState>(
    'shows a failure',
    build: () {
      when(
        () => getFaqs(any()),
      ).thenAnswer((_) async => const Err(NetworkFailure()));
      return FaqsCubit(getFaqs);
    },
    act: (cubit) => cubit.load(),
    expect: () => const [
      FaqsState.loading(),
      FaqsState.failure(NetworkFailure()),
    ],
  );

  blocTest<FaqsCubit, FaqsState>(
    'one question open at a time; tapping it again closes it',
    build: () => FaqsCubit(getFaqs),
    seed: () => const FaqsState.loaded(_faqs, expanded: 0),
    act: (cubit) => cubit
      ..toggle(1)
      ..toggle(1),
    expect: () => const [
      FaqsState.loaded(_faqs, expanded: 1),
      FaqsState.loaded(_faqs),
    ],
  );
}
