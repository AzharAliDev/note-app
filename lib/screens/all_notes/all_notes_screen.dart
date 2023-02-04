import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/repository/firebase_repo.dart';
import 'package:noteapp/screens/all_notes/models/note.dart';
import 'package:noteapp/screens/all_notes/widgets/note_item.dart';
import 'package:noteapp/screens/note_details/note_details_screen.dart';

class AllNoteScreen extends StatelessWidget {
  const AllNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NoteDetailsScreen(),
            ),
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseRepo().getAllNotes(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No notes found'));
          }

          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            padding: const EdgeInsets.all(12.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data!.docs[index].data();
              final Note note = Note.fromMap(data);
              return NoteItem(note: note);
            },
          );
        },
      ),
    );
  }
}
