import 'package:flutter/material.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/getAll_cubit.dart';
import 'package:prisma_app_note/features/presentaion/view/widget/homePage/GetAllPage.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key, required this.getAllBloc});
  final GetAllBloc getAllBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.redAccent,
      body: Center(child: GetAllWidget(getAllBloc: getAllBloc)),
    );
  }
}
