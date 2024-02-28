import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/email_box/email_box_state.dart';

class BoxBloc extends Cubit<BoxState> {
  final String type;
  BoxBloc({required this.type}) : super(ValidateState());

  String? input;
  void setInput(String? changeInput) {
    input = changeInput;
  }

  void validate() {
    if (input != null && input != '') {
      emit(ValidateState());
    } else {
      emit(FailureState());
    }
  }
}
