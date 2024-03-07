import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/home_page.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/login_page.dart';

class DecisionPage extends StatelessWidget {
  const DecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (state, context) {
      if (state is AuthLoading) {
        return const Scaffold(
          body: Text("Loading ..."),
        );
      } else if (state is Authentified) {
        return const HomePage();
      } else {
        return LoginPage();
      }
    });
  }
}
