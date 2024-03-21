import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:kula/config/app_environment.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
import 'package:kula/cubits/user_cubit/user_model.dart';
import 'package:kula/services/auth_service.dart';
import 'package:kula/services/otp_service.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';
import 'package:kula/utils/types.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  final UserCubit userCubit;
  final OTPService otpService;
  final LoadingCubit loadingCubit;
  AuthCubit(
      this.authService, this.otpService, this.loadingCubit, this.userCubit)
      : super(const AuthState.unauthenticated());

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    loadingCubit.loading(message: "Please Wait a moment ");
    emit(const AuthState.unauthenticated());
    final authResponse =
        await authService.loginWithEmailAndPassword(email, password);
    loadingCubit.loaded();

    if (authResponse.error != null) {
      emit(AuthState.error(errorMessage: authResponse.error ?? ""));
      return;
    }
    final Token token = authResponse.data!.token;
    final User user = authResponse.data!.user;
    _emitAuthenticatedState(user, token);
  }

  Future<void> createAccount({
    required RegistrationInput data,
  }) async {
    if (!(data.validateInput())) {
      if (AppEnvironment.isDevelopment) {
        throw "Invalid input error";
      }
      return;
    }

    loadingCubit.loading(message: "Creating Account");
    emit(const AuthState.unauthenticated());
    final createAccountResponse = await authService.createAccount(
      firsName: data.firstName ?? "",
      lastName: data.lastName ?? "",
      phoneNumber: data.phoneNumber ?? "",
      //TODO:remove this
      dob: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      email: data.email ?? "",
      password: data.password ?? "",
    );
    loadingCubit.loaded();

    if (createAccountResponse.error != null) {
      emit(AuthState.error(errorMessage: createAccountResponse.error ?? ""));
      return;
    }

    final Token token = createAccountResponse.data!.token;
    final User user = createAccountResponse.data!.user;
    _emitAuthenticatedState(user, token);
  }

  void _emitAuthenticatedState(User user, Token token) {
    emit(AuthState.authenticated(userId: user.id, token: token));
    userCubit.emitUserDetails(user);
  }
}
