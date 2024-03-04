import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/logIn/log_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitState());

  final AuthRepo _authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    var result = await _authRepo.login(email, password);
    print(result);
    result.fold((failure) {
      emit(LoginFailureState(failure.errorMessage));
    }, (success) {
      emit(LoginSuccessState(success));
    });
  }
}
