import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/email_box/email_box_cubit.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/password_box/password_box_cubit.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton({super.key, required this.formKey});
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<EmailBoxBloc>(context).validate();
        BlocProvider.of<PasswordBoxBloc>(context).validate();
        Future.delayed(const Duration(milliseconds: 100), () {
          if (formKey.currentState!.validate()) {
            print("Validated successfully");
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
