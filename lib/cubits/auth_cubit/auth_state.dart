part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated({
    required String userId,
    required ({String access, String refresh}) token,
  }) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error({
    required String errorMessage,
  }) = _Error;
}
