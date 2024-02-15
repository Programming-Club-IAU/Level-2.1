import 'core/note_app.dart';
import 'dart:io';
  List<NoteApp> notes = [];
  void main() {
    int choice = 0;
    
    String main_menu="""
      1- Create a note 
      2- Edit a note
      3- Delete a note 
      4- Search for a note
      5- Exit
                                  
      Your Choice: """ ;

    do{
      print("${main_menu}");
      choice = int.parse(stdin.readLineSync()!);
      switch(choice){
        case 1: createNote();
        break;
        case 2:print("");
        break;
        case 3:print("");
        break;
        case 4:print("");
        break;
        case 5: choice = 5;
        break;
        default:print("Wrong Entry. Please enter a valid option."); 
      }
    } while(choice != 5);
  }
  void createNote(){
    String? title;
    String? content;
    print("Title:");
    title = stdin.readLineSync()!;
    print("Content:");
    content = stdin.readLineSync()!;
    notes.add(NoteApp(
      title: title,
      content: content,
    ));
    print("Note saved.");
  }
  void updateNote(){
    if(notes.isEmpty){
      print("No notes to update.");
    }
    else{
      print("Enter index of the note to be updated.");
      int i = int.parse(stdin.readLineSync()!);
      if (i< 0 || i >= notes.length){
        print("invalid index: index is not within available range.");
      }
      else{
        print("New  note title: ");
        notes[i].title = stdin.readLineSync()!;
        print("New note content: ");
        notes[i].content = stdin.readLineSync()!;
        print("Note updated sucessfully.");
      }
    }
  }