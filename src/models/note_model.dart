//TODO: Define a note model class

class Note {
  String _title; // note title
  String _body; // note content

  DateTime _dateModified=DateTime.now(); // time record

  //constructor
  Note(this._title,this._body) {
  
  }
  //GETTERS
  String getTitle() {
    return _title;
  }

  String getBody() {
    return _body;
  }
  DateTime getDate() {
    return _dateModified;
  }

  //SETTERS
  void setTitle(String title) {
    this._title = title;
  }

  void setBody(String body) {
    this._body = body;
  }

  
  void setDate(DateTime newDate) {
    this._dateModified = newDate;
  }
}
