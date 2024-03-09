import 'package:prisma_app_note/features/data/models/notes.dart';

abstract class NotesState {}

class NotesInit extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {
  final List<Notes> notes;

  NotesSuccess(this.notes);
}

class NotesFailure extends NotesState {
  final String failure;

  NotesFailure(this.failure);
}
