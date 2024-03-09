import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/core/utils/shared_pref.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/login_page.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInit());
  final AuthRepo _authRepo;
  late String uid;

  Future<void> checkAuthentication() async {
    final bool isAuthenticated = await checkLocalAuthStatus();

    if (isAuthenticated) {
      final token = await getTokenFromLocalStorage();

      uid = token["uid"];
      print("check test : $uid");
      emit(Authentified(token.toString()));
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
      saveTokenToLocalStorage(success.toString());
      uid = success["uid"];
      print("Tessssssssssst : $uid");
      emit(Authentified(success["uid"]));
    });
  }

  Future<void> register(String email, password) async {
    emit(AuthLoading());
    var result = await _authRepo.register(email, password);
    result.fold((failure) {
      emit(UnAuth(failure.errorMessage));
    }, (success) {
      saveTokenToLocalStorage(success.toString());
      emit(Authentified(success["uid"]));
    });
  }

  Future<void> logout(BuildContext context) async {
    emit(AuthLoading());
    await clearTokenFromLocalStorage();

    emit(UnAuth("Log out"));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
