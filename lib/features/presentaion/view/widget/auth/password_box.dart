import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/AuthCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/AuthCubit/box_state.dart';

class PasswordBox extends StatelessWidget {
  const PasswordBox({required this.passwordBox, super.key});
  final BoxBloc passwordBox;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: passwordBox,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 370,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextFormField(
                onChanged: passwordBox.setInput,
                validator: (val) =>
                    (state is ValidateState) ? null : "enter your password",
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  suffixIconColor: Colors.black54,
                  focusColor: Colors.black54,
                  fillColor: Colors.black54,
                  border: InputBorder.none,
                  hintText: "password",
                  suffixIcon: const Icon(Icons.lock_outline),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          );
        });
  }
}
