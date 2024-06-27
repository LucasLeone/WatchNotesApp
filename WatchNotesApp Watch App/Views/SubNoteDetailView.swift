//
//  SubNoteDetailView.swift
//  WatchNotesApp Watch App
//
//  Created by Lucas Leone on 27/06/2024.
//

import SwiftUI

struct SubNoteDetailView: View {
    @ObservedObject var viewModel: SubNoteViewModel
    @ObservedObject var noteViewModel: NoteViewModel
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.subNote.content)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.subNote.title)
    }
}
