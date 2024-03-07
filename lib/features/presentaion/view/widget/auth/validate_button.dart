import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/state_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/boxCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/pages/home_page.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton({
    super.key,
    required this.formKey,
    required this.emailBox,
    required this.passwordBox,
    required this.getAllBloc,
    required this.type,
  });
  final dynamic formKey;
  final BoxBloc emailBox;
  final BoxBloc passwordBox;
  final GetAllBloc getAllBloc;

  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is Authentified) {
        print("ssssssssssssssssssssssssssssssssss \n");
        print(state.token);
        // getAllBloc.fetchAllUsers();
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => UsersPage(
        //               getAllBloc: getAllBloc,
        //             )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else if (state is UnAuth) {
        // print("fffffffffffffffffffffffffffffffffffff\n");
        print(state.failure);
      }
    }, builder: (context, state) {
      return GestureDetector(
        onTap: () {
          emailBox.validate();
          passwordBox.validate();
          Future.delayed(const Duration(milliseconds: 100), () {
            if (formKey.currentState!.validate()) {
              if (type == 'Sign in') {
                BlocProvider.of<AuthCubit>(context)
                    .login(emailBox.input!, passwordBox.input!);
              } else {
                BlocProvider.of<AuthCubit>(context)
                    .register(emailBox.input!, passwordBox.input!);
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
    });
  }
}
