import 'package:flutter/material.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/AuthCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/home_page.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton(
      {super.key,
      required this.formKey,
      required this.emailBox,
      required this.passwordBox,
      required this.getAllBloc});
  final dynamic formKey;
  final BoxBloc emailBox;
  final BoxBloc passwordBox;
  final GetAllBloc getAllBloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        emailBox.validate();
        passwordBox.validate();
        Future.delayed(const Duration(milliseconds: 100), () {
          if (formKey.currentState!.validate()) {
            getAllBloc.fetchAllUsers();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          getAllBloc: getAllBloc,
                        )));
          }
        });
      },
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            "Sign in",
          ),
        ),
      ),
    );
  }
}
