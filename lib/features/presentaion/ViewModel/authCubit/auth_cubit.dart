import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/core/utils/shared_pref.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInit());
  final AuthRepo _authRepo;

  Future<void> checkAuthentication() async {
    final bool isAuthenticated = await checkLocalAuthStatus();

    if (isAuthenticated) {
      final token = await getTokenFromLocalStorage();
      emit(Authentified(token!));
    } else {
      emit(UnAuth("Unauthentified account"));
    }
  }

  Future<void> login(String email, password) async {
    emit(AuthLoading());
    var result = await _authRepo.login(email, password);

    result.fold((failure) {
      emit(UnAuth(failure.errorMessage));
    }, (success) {
      saveTokenToLocalStorage(success);
      emit(Authentified(success));
    });
  }

  Future<void> register(String email, password) async {
    emit(AuthLoading());
    var result = await _authRepo.register(email, password);
    result.fold((failure) {
      emit(UnAuth(failure.errorMessage));
    }, (success) {
      saveTokenToLocalStorage(success);
      emit(Authentified(success));
    });
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await clearTokenFromLocalStorage();

    emit(UnAuth("Log out"));
  }
}
