import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/cubits/user_cubit/wallet_model.dart';
import 'package:kula/services/user_service.dart';

import 'user_model.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserService userService;
  UserCubit(this.userService) : super(const UserState.noUser());

  Future<String?> getWalletInfo() async {
    final response = await userService.getWallet();

    if (response.error != null || state.user == null || response.data == null) {
      return response.error ?? "";
    }
    emitUserDetails(state.user!, response.data!);

    return null;
  }

  emitUserDetails(User user, WalletData walletData) {
    emit(UserState.details(user: user, wallet: walletData));
  }

  updateUserDetails(User user) {
    emit((state as _Details).copyWith(user: user));
  }
}
