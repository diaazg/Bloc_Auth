import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prisma_app_note/features/data/models/notes.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/authCubit/auth_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/notesCubit/notes_cubit.dart';
import 'package:prisma_app_note/features/presentaion/ViewModel/notesCubit/notes_states.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          const Text("Welcome again !!"),
          BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
            if (state is NotesSuccess) {
              List<Notes> notes = state.notes;
              return SizedBox(
                height: 500,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${notes[index].content}"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 5);
                    },
                    itemCount: notes.length),
              );
            } else if (state is NotesFailure) {
              return Text(state.failure);
            } else {
              return const Text("No notes");
            }
          }),
          TextButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logout(context);
              },
              child: const Text("Log out")),
          TextButton(
              onPressed: () {
                String uid = BlocProvider.of<AuthCubit>(context).uid;
                BlocProvider.of<NotesCubit>(context).fetchNotes(uid);
              },
              child: const Text("Refresh")),
        ],
      ),
    );
  }
}
