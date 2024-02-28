import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/password_box/password_box_state.dart';

class PasswordBoxBloc extends Cubit<PasswordBoxState> {
  PasswordBoxBloc() : super(ValidatePasswrodState());

  String? password;
  void setPassword(String? changePassword) {
    password = changePassword;
  }

  void validate() {
    if (password != null && password != '') {
      emit(ValidatePasswrodState());
    } else {
      emit(FailurePasswordState());
    }
  }
}
