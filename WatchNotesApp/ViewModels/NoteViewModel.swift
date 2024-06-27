//
//  NoteViewModel.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import Foundation
import Combine

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []

    @CloudDefault(key: "notes", defaultValue: [Note]())
    var storedNotes: [Note]
    
    init() {
        self.notes = storedNotes
        print("Loaded notes: \(self.notes)")  // Verifica si las notas se están cargando correctamente
    }
        
    func addNote(title: String) {
        let newNote = Note(title: title, subNotes: [])
        notes.append(newNote)
        saveNotes()
    }
    
    func addSubNote(to note: Note, title: String, content: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            let newSubNote = SubNote(title: title, content: content)
            notes[index].subNotes.append(newSubNote)
            saveNotes()
        }
    }
    
    func removeNote(note: Note) {
        notes.removeAll { $0.id == note.id }
        saveNotes()
    }
    
    func removeSubNote(from note: Note, subNote: SubNote) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].subNotes.removeAll { $0.id == subNote.id }
            saveNotes()
        }
    }
    
    func updateNote(note: Note, newTitle: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].title = newTitle
            saveNotes()
        }
    }
    
    func saveNotes() {
        storedNotes = notes
        print("Saved notes: \(self.notes)")  // Verifica si las notas se están guardando correctamente
    }
}
