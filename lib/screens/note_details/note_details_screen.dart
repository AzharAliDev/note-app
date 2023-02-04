import 'package:flutter/material.dart';
import 'package:noteapp/core/extensions/build_context_extension.dart';
import 'package:noteapp/core/repository/firebase_repo.dart';
import 'package:noteapp/screens/all_notes/models/note.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({this.note, Key? key}) : super(key: key);

  final Note? note;

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  final _titleCtrl = TextEditingController();
  final _detailCtrl = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      // this will help you to assign the existing values to the text fields
      _titleCtrl.text = widget.note!.title!;
      _detailCtrl.text = widget.note!.details!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.note == null ? const Text('Note Details') : const Text('Edit Note'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleCtrl,
                    style: context.titleLarge,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: context.titleLarge,
                      // border: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    controller: _detailCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Details',
                      border: InputBorder.none,
                    ),
                    maxLines: 50,
                  ),
                ],
              ),
            ),
          ),
          if (_isProcessing)
            const Center(child: CircularProgressIndicator())
          else if (widget.note == null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 36.0,
              width: double.infinity,
              child: ElevatedButton(onPressed: () => _saveNote(), child: const Text('Save')),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 36.0,
              width: double.infinity,
              child: ElevatedButton(onPressed: () => _updateNote(), child: const Text('Update')),
            ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }

  bool _isProcessing = false;

  Future<void> _saveNote() async {
    if (_titleCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Title is required')));
      return;
    }
    if (_detailCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Details is required')));
      return;
    }
    _isProcessing = true;
    setState(() {});
    Note note = Note(
      title: _titleCtrl.text,
      details: _detailCtrl.text,
      createdAt: DateTime.now(),
    );
    final FirebaseRepo repo = FirebaseRepo();
    await repo.saveNote(note);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _updateNote() async {
    if (_titleCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Title is required')));
      return;
    }
    if (_detailCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Details is required')));
      return;
    }
    _isProcessing = true;
    setState(() {});
    Note note = widget.note!.copyWith(
      title: _titleCtrl.text,
      details: _detailCtrl.text,
      createdAt: DateTime.now(),
    );
    final FirebaseRepo repo = FirebaseRepo();
    await repo.updateNote(note);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
