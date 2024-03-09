import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repo_imp.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';
import 'package:prisma_app_note/features/data/repos/notes/notes_repos_imp.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/notesCubit/notes_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/decision_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthRepo authRepo = AuthRepoImp(apiService: ApiService(Dio()));
    final NotesRepoImp notesRepoImp = NotesRepoImp(ApiService(Dio()));

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo)..checkAuthentication(),
        ),
        BlocProvider<NotesCubit>(
          create: (context) {
            final authCubit = context.read<AuthCubit>();

            // Check if the user is authenticated before fetching notes
            if (authCubit.state is Authentified) {
              final uid = authCubit.uid;
              print("uid is : firsssssssssssss : $uid");
              return NotesCubit(notesRepoImp)..fetchNotes(uid);
            } else {
              return NotesCubit(
                  notesRepoImp); // Or handle non-authenticated state accordingly
            }
          },
        )
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
