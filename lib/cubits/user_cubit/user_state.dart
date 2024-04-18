part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState.details(
      {required User user, required WalletData wallet}) = _Details;
  const factory UserState.noUser() = _NoUser;

  User? get user {
    return map(details: (user) => user.user, noUser: (_) => null);
  }

  WalletData? get wallet {
    return map(details: (user) => user.wallet, noUser: (_) => null);
  }
}
