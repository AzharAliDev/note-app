import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:noteapp/screens/all_notes/models/note.dart';

class FirebaseRepo {
  // always make variable private for within the class
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllNotes() {
    return _firestore.collection('notes').snapshots();
  }

  Future<void> saveNote(Note note) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    String id = _firestore.collection('notes').doc().id;
    note = note.copyWith(id: id);
    try {
      await notes.doc(id).set(note.toMap());
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> updateNote(Note note) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    try {
      await notes.doc(note.id).update(note.toMap());
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
