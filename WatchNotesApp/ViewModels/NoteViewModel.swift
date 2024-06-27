//
//  NoteViewModel.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI
import Combine

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    init() {
        self.notes = loadNotes()
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
    
    private func saveNotes() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "notes")
        }
    }
    
    private func loadNotes() -> [Note] {
        if let savedNotes = UserDefaults.standard.object(forKey: "notes") as? Data {
            let decoder = JSONDecoder()
            if let loadedNotes = try? decoder.decode([Note].self, from: savedNotes) {
                return loadedNotes
            }
        }
        return []
    }
}
