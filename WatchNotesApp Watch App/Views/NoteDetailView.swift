//
//  NoteDetailView.swift
//  WatchNotesApp Watch App
//
//  Created by Lucas Leone on 27/06/2024.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    @ObservedObject var viewModel: NoteViewModel

    var body: some View {
        List {
            ForEach(note.subNotes) { subNote in
                VStack(alignment: .leading) {
                    Text(subNote.title)
                        .font(.headline)
                    Text(subNote.content)
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle(note.title)
    }
}
