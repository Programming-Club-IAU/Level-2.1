import 'dart:io';
import 'core/NoteManager.dart';

//Note project
void main(List<String> args) {
  NoteManager userMenu = new NoteManager();

  do {
    try {
      print("**************Welcome to Noteapp**************");
      print("1. Create a note");
      print("2. Edit a note");
      print("3. Delete a note");
      print("4. Search for a note");
      print("5. Display all");
      print("6. Exit\n");
      stdout.write("Enter your choice: ");
      String userInput = stdin.readLineSync() ?? "None";
      int choice = int.parse(userInput);

      switch (choice) {
        case 1:
          userMenu.createNote();
          break;

        case 2:
          userMenu.editNote();
          break;

        case 3:
          userMenu.deleteNote();
          break;

        case 4:
          userMenu.searchNote();
          break;

        case 5:
          userMenu.displayNote();
          break;

        case 6:
          print("Exiting the program.\n");
          return;

        default:
          print("Invalid number, please choose 1 to 6 only!\n");
          break;
      }
    } on FormatException catch (_) {
      print("Invalid input. Please enter a valid number.\n");
    } catch (e) {
      print("An unexpected error occurred: $e\n");
    }
  } while (true);
}
