import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/AuthCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repo_imp.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/auth/email_box.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/auth/password_box.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/auth/validate_button.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/homePage/GetAllPage.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final BoxBloc emailBox = BoxBloc(type: "email");
    final BoxBloc passwordBox = BoxBloc(type: "password");
    final GetAllBloc getAllBloc =
        GetAllBloc(AuthRepoImp(apiService: ApiService(Dio())));
    return Scaffold(
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
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
