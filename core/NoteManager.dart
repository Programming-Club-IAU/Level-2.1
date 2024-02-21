import 'dart:io';
import 'note.dart';

//Manage operation of program (create,edit,delete,search,display).
class NoteManager {
  List<Note> notes = [];

//Creates a new note and adds it to the list of notes.
  void createNote() {
    String title, content;

    do {
      print("Enter the note title: ");
      title = stdin.readLineSync()?.trim() ?? "";

      if (title.isEmpty) {
        print("Note title cannot be empty. Please provide a title.\n");
      }
    } while (title.isEmpty);

    // Check if a note with the same title already exists
    if (notes.any((note) => note.title == title)) {
      print(
          "A note with the title '$title' already exists. Please choose a different title.\n");
      return;
    }

    print("Enter the note content: ");
    content = stdin.readLineSync() ?? "None";

    Note newNote = Note(title: title, content: content);
    notes.add(newNote);

    print("The note is successfully created!\n");
  }

//Display all notes of the list.
  void displayNote() {
    if (notes.isEmpty) {
      print("Nothing to display!");
    } else {
      print("All notes: ");
      for (var note in notes)
        print("Title: ${note.title}\n Contents: ${note.content}\n ");
    }
  }

  //Edit the title and content of note.
  void editNote() {
    if (notes.isEmpty) {
      print("Nothing to edit!");
      return;
    }
    print("Enter the title of the note to edit: ");
    String newTitle = stdin.readLineSync() ?? "None";
    for (var note in notes) {
      if (note.title == newTitle) {
        print("Enter a new title: ");
        note.title = stdin.readLineSync() ?? "None";

        print("Enter a new content: ");
        note.content = stdin.readLineSync() ?? "None";

        print("The note is successfully edited!");
        return;
      }
    }
    print("Note with title '$newTitle' not found\n ");
  }

  //Delete specific note of the list.
  void deleteNote() {
    if (notes.isEmpty) {
      print("Nothing to delete!");
      return;
    }

    print("Enter the title of the note to delete:");
    var noteToDeleteTitle = stdin.readLineSync();

    var noteIndexToDelete =
        notes.indexWhere((note) => note.title == noteToDeleteTitle);

    if (noteIndexToDelete == -1) {
      print("Note with title '$noteToDeleteTitle' not found!");
    } else {
      var deletedNote = notes.removeAt(noteIndexToDelete);
      print("Note deleted: ${deletedNote.title}");
    }
  }

//Search about specific note by title or content of note.
  void searchNote() {
    if (notes.isEmpty) {
      print("Not found!");
      return;
    }

    print("Enter the title or content of the note to search:");
    var searchTitleOrContent = stdin.readLineSync() ?? "None";

    var matchingNotes = notes.where((note) =>
        note.title.contains(searchTitleOrContent) ||
        note.content.contains(searchTitleOrContent));

    if (matchingNotes.isEmpty) {
      print("No matching notes found!");
    } else {
      print("Matching notes: ");
      for (var note in matchingNotes) {
        print("Title: ${note.title}\nContents: ${note.content}\n");
      }
    }
  }
}
