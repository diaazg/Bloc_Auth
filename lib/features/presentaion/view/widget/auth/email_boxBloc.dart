import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/boxCubit/box_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/boxCubit/box_state.dart';

class EmailBox extends StatelessWidget {
  const EmailBox({super.key, required this.emailBloc});
  final BoxBloc emailBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: emailBloc,
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
                onChanged: emailBloc.setInput,
                validator: (val) =>
                    (state is ValidateState) ? null : "enter your email",
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  suffixIconColor: Colors.black54,
                  focusColor: Colors.black54,
                  fillColor: Colors.black54,
                  border: InputBorder.none,
                  hintText: 'email',
                  suffixIcon: const Icon(Icons.mail_outline),
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
