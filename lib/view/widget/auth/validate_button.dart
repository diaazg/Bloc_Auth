import 'package:flutter/material.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/email_box/email_box_cubit.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton(
      {super.key,
      required this.formKey,
      required this.emailBox,
      required this.passwordBox});
  final dynamic formKey;
  final BoxBloc emailBox;
  final BoxBloc passwordBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        emailBox.validate();
        passwordBox.validate();
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
