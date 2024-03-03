import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/getAll/get_all_state.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';

class GetAllBloc extends Cubit<GetAllState> {
  GetAllBloc(this._authRepo) : super(GetAllInitialState());

  final AuthRepo _authRepo;

  Future<void> fetchAllUsers() async {
    emit(GetAllLoadingState());
    var result = await _authRepo.fetchAll();
    result.fold((failure) {
      emit(GetAllFailureState(failure.errorMessage));
    }, (users) {
      emit(GetAllSuccessState(users));
    });
  }
}
