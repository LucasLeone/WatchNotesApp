//
//  SubNoteDetailView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct SubNoteDetailView: View {
    @ObservedObject var viewModel: SubNoteViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var noteViewModel: NoteViewModel
    var note: Note
    @State private var showingEditSubNoteView = false
    
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
        .navigationBarItems(trailing: HStack {
            Button(action: {
                showingEditSubNoteView.toggle()
            }) {
                Image(systemName: "pencil")
            }
            Button(action: {
                noteViewModel.removeSubNote(from: note, subNote: viewModel.subNote)
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        })
        .sheet(isPresented: $showingEditSubNoteView) {
            EditSubNoteView(viewModel: viewModel, noteViewModel: noteViewModel, note: note)
        }
    }
}
