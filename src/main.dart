import 'core/note_app.dart';
import 'dart:io';
  List<NoteApp> notes = [];
  void main() {
    int choice = 0;
    
    String main_menu="""
      1- Create a note 
      2- Edit a note
      3- Delete a note 
      4- view notes
      5- Exit
                                  
      Your Choice: """ ;

    do{
      print("${main_menu}");
      try{
        choice = int.parse(stdin.readLineSync()!);
      }
      catch(handleFormatError){
        print("Error:only integer input allowed.");
      };
      if(!(0<choice || choice>5)){
        print("Wrong Entry. Please enter a valid option.");
      }
      else{
        switch(choice){
        case 1: createNote();
        break;
        case 2:updateNote();
        break;
        case 3:deleteNote();
        break;
        case 4:viewNotes();
        break;
        case 5: choice = 5;
        break;
        default:print("Wrong Entry. Please enter a valid option."); 
        }
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
    print("------------------------------------");
  }
  void updateNote(){
    int i;
    if(notes.isEmpty){
      print("No notes to update.");
      print("------------------------------------");
    }
    else{
      print("Enter index of the note to be updated:");
      try{
        i = int.parse(stdin.readLineSync()!);
      }
      catch(handleFormatError){
        print("Error:only integer input allowed.");
        return;
      };
      if (i< 0 || i >= notes.length){
        print("invalid index: index is not within available range.");
        print("------------------------------------");
      }
      else{
        print("New  note title: ");
        notes[i].title = stdin.readLineSync()!;
        print("New note content: ");
        notes[i].content = stdin.readLineSync()!;
        print("Note updated sucessfully.");
        print("------------------------------------");
      }
    }
  }

  void deleteNote(){
    int i = 0;
    if(notes.isEmpty){
      print("No notes to delete.");
      print("------------------------------------");
    }
    else{
      print("Enter index of the note to be deleted:");
      try{
         i = int.parse(stdin.readLineSync()!);
      }
      catch(handleFormatError){
        print("Error:only integer input allowed.");
      };
      if (i< 0 || i >= notes.length){
        print("invalid index: index is not within available range.");
        print("------------------------------------");
      }
      else{
        notes.removeAt(i);
        print("Note deleted successfully.");
        print("------------------------------------");
      }
    }
  }

  void viewNotes(){
    int i;
    if(notes.isEmpty){
      print("No notes to view.");
      print("------------------------------------");
    }
    else{
      for(i=0; i<notes.length; i++){
        print("Note #${i}: ");
        print("Title: ${notes[i].title}");
        print("Content: ${notes[i].content}");
        print("------------------------------------\n");
      }
    }
  }