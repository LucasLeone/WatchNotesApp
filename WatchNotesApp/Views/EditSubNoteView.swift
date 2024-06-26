//
//  EditSubNoteView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct EditSubNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: SubNoteViewModel
    var noteViewModel: NoteViewModel
    var note: Note
    @State private var subNoteTitle: String
    @State private var subNoteContent: String
    
    init(viewModel: SubNoteViewModel, noteViewModel: NoteViewModel, note: Note) {
        self.viewModel = viewModel
        self.noteViewModel = noteViewModel
        self.note = note
        _subNoteTitle = State(initialValue: viewModel.subNote.title)
        _subNoteContent = State(initialValue: viewModel.subNote.content)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Editar subnota")) {
                    TextField("Título", text: $subNoteTitle)
                    TextEditor(text: $subNoteContent)
                        .frame(height: 200)
                        .padding(.all, 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    // Actualizar los valores de la subnota
                    if let index = noteViewModel.notes.firstIndex(where: { $0.id == note.id }) {
                        if let subNoteIndex = noteViewModel.notes[index].subNotes.firstIndex(where: { $0.id == viewModel.subNote.id }) {
                            noteViewModel.notes[index].subNotes[subNoteIndex].title = subNoteTitle
                            noteViewModel.notes[index].subNotes[subNoteIndex].content = subNoteContent
                        }
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Guardar")
                }
            }
            .navigationTitle("Editar subnota")
        }
    }
}
