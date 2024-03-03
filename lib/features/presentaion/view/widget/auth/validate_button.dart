import 'package:flutter/material.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/AuthCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/register/register_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/home_page.dart';

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
    return GestureDetector(
      onTap: () {
        emailBox.validate();
        passwordBox.validate();
        Future.delayed(const Duration(milliseconds: 100), () {
          if (formKey.currentState!.validate()) {
            if (type == 'Sign in') {
              getAllBloc.fetchAllUsers();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            getAllBloc: getAllBloc,
                          )));
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
  }
}
