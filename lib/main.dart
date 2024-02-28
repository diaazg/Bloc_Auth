import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/email_box/email_box_cubit.dart';
import 'package:prisma_app_note/ViewModel/AuthCubit/password_box/password_box_cubit.dart';
import 'package:prisma_app_note/view/pages/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmailBoxBloc>(
          create: (BuildContext context) => EmailBoxBloc(),
        ),
        BlocProvider<PasswordBoxBloc>(
          create: (BuildContext context) => PasswordBoxBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AuthScreen(),
      ),
    );
  }
}
