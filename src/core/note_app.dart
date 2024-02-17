import 'dart:io';
import '../models/note_model.dart';

class NoteApp {

  static List<Note> notes = []; // stores Note data
  

  NoteApp() {}
  
  
  static void addNote() { //Asks the user to enter the note's info to create object in the notes list
    print("\n\n\t***********************New Note***********************\n\n");
    stdout.write("\t\tEnter Note Title : ");
    String? title = stdin.readLineSync();
    stdout.write("\t\tEnter The Note Content: \n\t\t");
    String? note = stdin.readLineSync();
    Note n = new Note(title!, note!);

    notes.add(n);

    print("\n\t\t~Note Saved Successfully");
  }

  static void displayNotes() { //print the notes
    if(notes.isEmpty){
      print("\n\n\t\t~There are no notes to display.");
    }else{
    int i = 0;
    print("\n\t\t-------------------Notes List-------------------");
    notes.forEach((element) {
      print("\t\t\t${i + 1} - ${notes[i].getTitle()}");
      i++;
    });
    }
  }

  static void deleteNote() { //delete note by the displaying the notes and asking the user to choose
    String? ch;
    do {
      if (notes.isNotEmpty) {
        displayNotes();
        stdout.write("\t\tEnter the Number of the Note you want to delete: ");
        int x = (int.parse(stdin.readLineSync()!) - 1);
        if (x < notes.length) {
          notes.removeAt(x);
          print("\n\t\t~Note Deleted!");
          displayNotes();

          stdout.write("\n\t\t\tReturn to menu?(y/n): ");
          ch = stdin.readLineSync();
        }
      } else {
        print("\t\tThere are no notes stored in the system, please try again.");
        return;
      }
    } while (ch != 'y');
  }

  static void editNote() { //edit note info: title or content or both 
    int ch;
    String? re;
    int i;
    if (notes.isNotEmpty) {
      do{
      
      String update;
      displayNotes();
      stdout.write("\t\tEnter the Number of the Note you want to edit: ");
      i = (int.parse(stdin.readLineSync()!) - 1);

      while((i+1)>notes.length || (i+1)<0){
        stdout.write("\n\t\t~Invalid choice!");
        print("\n\t\t~Please enter a number from the list below");
        displayNotes();
        stdout.write("\t\tYoure Choice: ");
        i = (int.parse(stdin.readLineSync()!) - 1);
      }
      print("\n\t\t---------------NOTE OPEN-----------------");
      print(
          "\n\t\tTitle: ${notes[i].getTitle()}\n\t\tContent:\n\t\t${notes[i].getBody()}\n");
      print("\t\tLast modified: ${notes[i].getDate()}");
      stdout.write("\t\t~what do you wnat to edit? " +
          "\n\t\t1 - Note Tile\n\t\t2 - Note Content\n\t\t3 - Both\n\t\tYour Choice: ");
      ch = int.parse(stdin.readLineSync()!);
      switch(ch){ 
        case 1:
          stdout.write("\n\t\tEnter new title: ");
          update = stdin.readLineSync()!;
          notes[i].setTitle(update);
          notes[i].setDate(DateTime.now());
          break;
        case 2:
          stdout.write("\n\t\tEnter new content: ");
          update = stdin.readLineSync()!;
          notes[i].setBody(update);
          notes[i].setDate(DateTime.now());
          break;
        case 3:
          stdout.write("\n\t\tEnter new title: ");
          update = stdin.readLineSync()!;
          notes[i].setTitle(update);
          stdout.write("\n\t\tEnter new content: ");
          update = stdin.readLineSync()!;
          notes[i].setBody(update);
          notes[i].setDate(DateTime.now());
          break;

      }
      print("\n\t\t---------------Updated Note-----------------");
      print("\t\tTitle: ${notes[i].getTitle()}\n\t\tContent\n\t\t${notes[i].getBody()}");
      print("\t\tLast modified: ${notes[i].getDate()}");
      

      stdout.write("\n\t\t~Do you want to return to the menu?(y/n): ");
      re=stdin.readLineSync();
      }while(re!='y');
    } else {
      print("\t\tThere is no notes in the system");
    }
  }

  static void searchNote() { // search for a note by note title
    
    if (notes.isNotEmpty) {
      print("\t********************Seraching Note********************");
      stdout.write("\t\tPlease Enter The Note Title:");

      String? title = stdin.readLineSync();

      bool flag = false;
      int? index;
      for (int i = 0; i < notes.length; i++) {
        if (title == notes[i].getTitle()) {
          flag = true;
          index = i;
          break;
        }
      }

      if (flag) {
        print("\t\t~Note has been found!");
        print("\n\t\t---------------NOTE OPEN-----------------");
        print("\n\t\tNote title: ${notes[index!].getTitle()}\n\t\tContent:\n\t\t${notes[index].getBody()}");
      } else {
        print("\t\t~Note has not been found in the system");
      }
    } else {
      print("\t\tThere is no notes in the system");
    }
  }
}
