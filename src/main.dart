//Note taking app with all CRUD  operations
//importing the class and io library for input
import 'core/note_app.dart';
import 'dart:io';
  List<NoteApp> notes = []; //class arraylist for flexable size
  void main() {
    int choice = 0; // intializing variable choice with 0
    
    //String to display menu item
    String main_menu="""
      1- Create a note 
      2- Edit a note
      3- Delete a note 
      4- View notes
      5- Exit
                                  
      Your Choice: """ ;

//do while loop which enables continuous operation and halts when user enter 5 
    do{
      print("${main_menu}");
      try{
        choice = int.parse(stdin.readLineSync()!);//try-catch and integer parse to ensure correct user entry
      }
      catch(handleFormatError){
        print("Error:only integer input allowed.");
      };
      if(!(0<choice || choice>5)){
        print("Wrong Entry. Please enter a valid option.");
      }
      //switch statement with all the available operations
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
  //creating a note with its title and content and null safety feature 
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
  //updating a note with new title and content 
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
//deleteing a note using its specific index  
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
//displaying all the saved notes if any are saved
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