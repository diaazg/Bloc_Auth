import 'package:flutter/material.dart';
import 'package:prisma_app_note/view/widget/auth/email_box.dart';
import 'package:prisma_app_note/view/widget/auth/password_box.dart';
import 'package:prisma_app_note/view/widget/auth/validate_button.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
              key: _formkey,
              child: Column(
                children: [
                  const EmailBox(),
                  const PasswordBox(),
                  ValidateButton(
                    formKey: _formkey,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
