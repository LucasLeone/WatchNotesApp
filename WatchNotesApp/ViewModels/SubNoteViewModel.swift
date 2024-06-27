//
//  SubNoteViewModel.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import Foundation
import Combine

class SubNoteViewModel: ObservableObject {
    @Published var subNote: SubNote
    private var noteViewModel: NoteViewModel
    private var parentNote: Note

    init(subNote: SubNote, noteViewModel: NoteViewModel, parentNote: Note) {
        self.subNote = subNote
        self.noteViewModel = noteViewModel
        self.parentNote = parentNote
    }
    
    func updateSubNoteInNote(newTitle: String, newContent: String) {
        if subNote.title != newTitle || subNote.content != newContent {
            subNote.title = newTitle
            subNote.content = newContent
            if let index = noteViewModel.notes.firstIndex(where: { $0.id == parentNote.id }) {
                if let subNoteIndex = noteViewModel.notes[index].subNotes.firstIndex(where: { $0.id == subNote.id }) {
                    noteViewModel.notes[index].subNotes[subNoteIndex] = subNote
                    noteViewModel.saveNotes()
                }
            }
        }
    }
}
