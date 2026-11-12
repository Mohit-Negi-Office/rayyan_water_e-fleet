import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/repositories/auth_repository.dart';

final class VerifyOtpParams extends Equatable {
  const VerifyOtpParams({required this.phone, required this.code});

  final PhoneNumber phone;
  final String code;

  @override
  List<Object?> get props => [phone, code];
}

@injectable
class VerifyOtp implements UseCase<void, VerifyOtpParams> {
  const VerifyOtp(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(VerifyOtpParams params) =>
      _repository.verifyOtp(params.phone, params.code);
}
