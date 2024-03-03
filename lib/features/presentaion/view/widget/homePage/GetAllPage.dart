import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/data/models/user_model.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/get_all_state.dart';

class GetAllWidget extends StatelessWidget {
  const GetAllWidget({
    super.key,
    required this.getAllBloc,
  });
  final GetAllBloc getAllBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBloc, GetAllState>(
        bloc: getAllBloc,
        builder: (context, state) {
          if (state is GetAllInitialState) {
            return const Text("Initial State");
          } else if (state is GetAllFailureState) {
            return Text(state.errMessage);
          } else if (state is GetAllSuccessState) {
            List<UserModel> users = state.users;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${users[index].email}"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: users.length);
          } else {
            return const Text("wait ...");
          }
        });
  }
}
