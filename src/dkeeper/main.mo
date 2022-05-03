// ?This is Backend:
import List "mo:base/List";
import Debug "mo:base/Debug";
import take "mo:base/take";
import drop "mo:base/drop";
import append "mo:base/append";

actor DKeeper {

  // ?<CREATE> make obj to use it in the app / type = obj / make it public to use it in the jsx files:
  public type Note = {
    title: Text;
    content: Text;

  };
  // ?<STORE IN THE BK> make a note list with empty list(nil)/ stable make the notes updated not get delete with every deploy:
  stable  var notes : List.List<Note> = List.nil<Note>();

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
  //? make query to it's get faster res & give it to react front as an array use toArray method:
  public query func readNotes(): async [Note]{
    return List.toArray(notes);
  };

  //? <DELETE> func:
  public func removeNote(id: Nat){
    //? Take method = take/choose the first element you give of a number:
    listFront =  List.take(notes,index);
    //? Drop method = delete from a list:
    listBack = List.drop(notes,index);
    //? Append method = put list in a list:
    notes := List.append(listFront,listBack);

  };
}