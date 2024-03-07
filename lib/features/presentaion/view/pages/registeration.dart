import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/boxCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repo_imp.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/auth/email_boxBloc.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/auth/password_boxBloc.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/auth/validate_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthRepo authRepo = AuthRepoImp(apiService: ApiService(Dio()));
    final BoxBloc emailBox = BoxBloc(type: "email");
    final BoxBloc passwordBox = BoxBloc(type: "password");
    final GetAllBloc getAllBloc = GetAllBloc(authRepo);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Form(
              key: _formkey,
              child: Column(
                children: [
                  EmailBox(emailBloc: emailBox),
                  PasswordBox(passwordBox: passwordBox),
                  ValidateButton(
                    emailBox: emailBox,
                    passwordBox: passwordBox,
                    formKey: _formkey,
                    getAllBloc: getAllBloc,
                    type: 'Sign up',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                    if (state is Authentified) {
                      return Text(state.token);
                    } else if (state is UnAuth) {
                      return Text(state.failure);
                    } else {
                      return const Text('Wait posting ...');
                    }
                  })
                ],
              )),
        ],
      ),
    );
  }
}
