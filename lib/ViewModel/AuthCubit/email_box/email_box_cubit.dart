import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/email_box/email_box_state.dart';

class EmailBoxBloc extends Cubit<EmailBoxState> {
  EmailBoxBloc() : super(ValidateEmailState());

  String? password;
  void setEmail(String? changePassword) {
    password = changePassword;
  }

  void validate() {
    if (password != null && password != '') {
      emit(ValidateEmailState());
    } else {
      emit(FailureEmailState());
    }
  }
}
