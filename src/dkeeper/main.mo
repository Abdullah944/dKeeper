// ?This is Backend:
import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  // ?<CREATE> make obj to use it in the app / type = obj / make it public to use it in the jsx files:
  public type Note = {
    title: Text;
    content: Text;

  };
  // ?<STORE IN THE BK> make a note list with empty list(nil):
  var notes : List.List<Note> = List.nil<Note>();

  // ? <Create> Function / will take title & content from the inputs in jsx files:
  public func createNote(titleText: Text, contentText: Text){

   // ?<use to UPDATE> new note will be type note and take the inputs:
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

     // ?<delete & update> make the list this after pushing/ push will put it at first item / (what to push , listname):
     notes :=  List.push(newNote, notes);
     Debug.print(debug_show(notes));

  };
}