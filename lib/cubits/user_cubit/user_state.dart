part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  // const UserState._();

  const factory UserState.details({required User user}) = _Details;
  const factory UserState.noUser() = _NoUser;
}
