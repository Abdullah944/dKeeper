import React, { useEffect, useState } from "react";
import Header from "./Header";
import Footer from "./Footer";
import Note from "./Note";
import CreateArea from "./CreateArea";
// ? DFX FILEs / FUNC:
import { dkeeper } from "../../../declarations/dkeeper";

function App() {
  const [notes, setNotes] = useState([]);

  function addNote(newNote) {
    setNotes((prevNotes) => {
      // ? calling the func & assign it's input to the newNote of the front end:
      dkeeper.createNote(newNote.title, newNote.content);
      return [newNote, ...prevNotes]; //? make the order backward. from this [...prevNotes,newNote]
    });
  }
  // ? make update with every new note:
  useEffect(() => {
    console.log("use effect");
    fetchData();
  }, []);

  // ? Make func to get the data from the back & but it in a use effect to get with every change of note
  async function fetchData() {
    const notesArray = await dkeeper.readNotes();
    setNotes(notesArray);
  }

  function deleteNote(id) {
    // ? depend on the id  delete the note from the back:
    dkeeper.removeNote(id);
    setNotes((prevNotes) => {
      return prevNotes.filter((noteItem, index) => {
        return index !== id;
      });
    });
  }

  return (
    <div>
      <Header />
      <CreateArea onAdd={addNote} />
      {notes.map((noteItem, index) => {
        return (
          <Note
            key={index}
            id={index}
            title={noteItem.title}
            content={noteItem.content}
            onDelete={deleteNote}
          />
        );
      })}
      <Footer />
    </div>
  );
}

export default App;
