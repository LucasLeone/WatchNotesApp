//
//  SubNoteViewModel.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import Foundation

class SubNoteViewModel: ObservableObject {
    @Published var subNote: SubNote

    init(subNote: SubNote) {
        self.subNote = subNote
    }
}
