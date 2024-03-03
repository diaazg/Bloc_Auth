import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/register/regitser_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc(this._authRepo) : super(RegisterStateInit());

  final AuthRepo _authRepo;

  Future<void> register(String email, String password) async {
    emit(RegisterStateLoading());
    var result = await _authRepo.register(email, password);
    result.fold((failure) {
      emit(RegisterStateFailure(failure.errorMessage));
    }, (success) {
      emit(RegisterStateSuccess(success));
    });
  }
}
