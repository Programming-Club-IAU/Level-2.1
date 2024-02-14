import 'core/note_app.dart';
import 'dart:io';
void main(List<String> args) {
   int choice = 0;
   String main_menu="""
    *** Welcome to Hosiptal System ***
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
      case 1:print("");
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
