import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is UnAuth) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.amber,
        body: Column(
          children: [
            const Text("Welcom again !!"),
            TextButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
                child: const Text("Log out"))
          ],
        ),
      );
    });
  }
}
