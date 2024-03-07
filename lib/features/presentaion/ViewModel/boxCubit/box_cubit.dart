import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/boxCubit/box_state.dart';

class BoxBloc extends Cubit<BoxState> {
  final String type;
  BoxBloc({required this.type}) : super(ValidateState());

  String? input;
  void setInput(String? changeInput) {
    input = changeInput;
  }

  void validate() {
    if (type == "email") {
      if (input != null &&
          input != '' &&
          input!.contains("@") &&
          input!.contains(".") &&
          input!.length > 4) {
        emit(ValidateState());
      } else {
        emit(FailureState());
      }
    } else {
      if (input != null && input != '' && input!.length > 5) {
        emit(ValidateState());
      } else {
        emit(FailureState());
      }
    }
  }
}
