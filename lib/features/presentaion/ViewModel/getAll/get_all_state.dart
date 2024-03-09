import 'package:prisma_app_note/features/data/models/user_model.dart';

abstract class GetAllState {}

class GetAllInitialState extends GetAllState {}

class RegisterInitState extends GetAllState {}

class GetAllSuccessState extends GetAllState {
  // ignore: prefer_typing_uninitialized_variables
  final List<UserModel> users;

  GetAllSuccessState(this.users);
}

class GetAllFailureState extends GetAllState {
  final String errMessage;

  GetAllFailureState(this.errMessage);
}

class GetAllLoadingState extends GetAllState {}

//register states
