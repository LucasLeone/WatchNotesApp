//
//  SubNoteViewModel.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI
import Combine

class SubNoteViewModel: ObservableObject {
    @Published var subNote: SubNote

    init(subNote: SubNote) {
        self.subNote = subNote
    }
    
    func updateSubNoteInNote(subNote: SubNote, newTitle: String, newContent: String) {
        if subNote.title != newTitle {
            self.subNote.title = newTitle
        }
        
        if subNote.content != newContent {
            self.subNote.content = newContent
        }
    }
}
