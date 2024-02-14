class NoteApp{
  String? note;
  String? title;

  NoteApp({
    this.note,
    this.title,
  });

  void display(){
    print("title: ${title}");
    print("${note}");
  }

}
