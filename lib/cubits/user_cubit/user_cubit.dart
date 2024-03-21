import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.noUser());

  emitUserDetails(User user) {
    emit(UserState.details(user: user));
  }
}
