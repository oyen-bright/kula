import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/services/auth_service.dart';
import 'package:kula/services/otp_service.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  final OTPService otpService;
  final LoadingCubit loadingCubit;
  AuthCubit(this.authService, this.otpService, this.loadingCubit)
      : super(const AuthState.unauthenticated());

  Future<
      ({
        String? error,
        String? message,
      })> verifyEmail({required email}) async {
    loadingCubit.loading();
    final response = await otpService.emailOTP(email);
    if (response.error != null) {
      return (error: response.error, message: response.data.toString());
    }
    loadingCubit.loading();
    return (error: null, message: response.data.toString());
  }
}
