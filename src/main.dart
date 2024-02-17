import 'core/note_app.dart';
import 'dart:io';


void main(List<String> args) {
  int? choice; // stores the user choice
  
  do {
    
    try { // try block for invalid input
      Menu();
      choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          NoteApp.addNote();
          break;
        case 2:
          NoteApp.editNote();
          break;
        case 3:
          NoteApp.deleteNote();
        case 4:
          NoteApp.searchNote();
          break;
      }
    } on FormatException {
      print("\t\tInvalid Choice: Enter only numbers Please!");
    }
  } while (choice != 5);
}

void Menu() { // print the menue
  stdout.write("\n\n\t********************Note Taking App********************\n\n" +
            "\t\t1- Create new note\n\t\t2- Edit a note\n\t\t3- Delete a note\n\t\t"
            +"4- Search for a note\n\t\t5- Exit\n\t\tYour Choice: ");
}
