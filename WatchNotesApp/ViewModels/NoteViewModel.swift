//
//  NoteViewModel.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []

    func addNote(title: String) {
        let newNote = Note(title: title, subNotes: [])
        notes.append(newNote)
    }
    
    func addSubNote(to note: Note, title: String, content: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            let newSubNote = SubNote(title: title, content: content)
            notes[index].subNotes.append(newSubNote)
        }
    }

    func removeNote(note: Note) {
        notes.removeAll { $0.id == note.id }
    }
    
    func removeSubNote(from note: Note, subNote: SubNote) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].subNotes.removeAll { $0.id == subNote.id }
        }
    }
}
