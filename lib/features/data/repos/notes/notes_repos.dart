import 'package:dartz/dartz.dart';
import 'package:prisma_app_note/core/error/failures.dart';
import 'package:prisma_app_note/features/data/models/notes.dart';

abstract class NotesRepos {
  Future<Either<Failure, List<Notes>>> fetchNotes(String uid);
}
