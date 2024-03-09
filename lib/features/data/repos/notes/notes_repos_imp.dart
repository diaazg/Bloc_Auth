import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prisma_app_note/core/error/failures.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/models/notes.dart';
import 'package:prisma_app_note/features/data/repos/notes/notes_repos.dart';

class NotesRepoImp extends NotesRepos {
  final ApiService apiService;

  NotesRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<Notes>>> fetchNotes(String uid) async {
    try {
      var data =
          await apiService.get(endPoint: 'userNotes', data: {"userID": uid});
      List<Notes> notes = [];
      List dataBody = data["body"];

      for (dynamic note in dataBody) {
        notes.add(Notes.fromJson(note));
      }

      return right(notes);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure("Oops there was an error , try again !"));
    }
  }
}
