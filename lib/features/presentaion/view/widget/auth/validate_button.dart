import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repo_imp.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/AuthCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/logIn/log_in_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/logIn/log_in_state.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/register/register_cubit.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton(
      {super.key,
      required this.formKey,
      required this.emailBox,
      required this.passwordBox,
      required this.getAllBloc,
      required this.type,
      required this.registerBloc});
  final dynamic formKey;
  final BoxBloc emailBox;
  final BoxBloc passwordBox;
  final GetAllBloc getAllBloc;
  final RegisterBloc registerBloc;
  final String type;

  @override
  Widget build(BuildContext context) {
    final AuthRepo authRepo = AuthRepoImp(apiService: ApiService(Dio()));
    final LoginCubit loginCubit = LoginCubit(authRepo);
    return BlocConsumer<LoginCubit, LoginState>(
        bloc: loginCubit,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            print("ssssssssssssssssssssssssssssssssss \n");
            print(state.jwt);
          } else if (state is LoginFailureState) {
            print("fffffffffffffffffffffffffffffffffffff\n");
            print(state.failure);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              emailBox.validate();
              passwordBox.validate();
              Future.delayed(const Duration(milliseconds: 100), () {
                if (formKey.currentState!.validate()) {
                  if (type == 'Sign in') {
                    loginCubit.login("messi@gmail.com", "123456");
                    // getAllBloc.fetchAllUsers();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => HomePage(
                    //               getAllBloc: getAllBloc,
                    //             )));
                  } else {
                    registerBloc.register(emailBox.input!, passwordBox.input!);
                  }
                }
              });
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  type,
                ),
              ),
            ),
          );
        });
  }
}
