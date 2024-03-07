import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repo_imp.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/decision_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthRepo authRepo = AuthRepoImp(apiService: ApiService(Dio()));

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo)..checkAuthentication(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const DecisionPage()),
    );
  }
}
