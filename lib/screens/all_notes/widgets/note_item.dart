import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/core/extensions/build_context_extension.dart';
import 'package:noteapp/screens/all_notes/models/note.dart';
import 'package:noteapp/screens/note_details/note_details_screen.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title ?? 'No title',
              overflow: TextOverflow.ellipsis,
              style: context.titleLarge,
              maxLines: 1,
            ),
            Expanded(
              child: Text(
                note.details ?? 'No details',
                style: context.bodySmall,
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (note.createdAt != null)
                  Text(
                    DateFormat('dd MMM yyyy').format(note.createdAt!),
                    // '4 Feb 2023',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NoteDetailsScreen(note: note),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(16.0),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.pencil,
                      size: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
