import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/data/repos/notes/notes_repos_imp.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/notesCubit/notes_states.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this._authRepo) : super(NotesInit());
  final NotesRepoImp _authRepo;

  Future<void> fetchNotes(String uid) async {
    emit(NotesLoading());

    var result = await _authRepo.fetchNotes(uid);

    result.fold((failure) {
      emit(NotesFailure(failure.errorMessage));
    }, (notes) {
      emit(NotesSuccess(notes));
    });
  }
}
