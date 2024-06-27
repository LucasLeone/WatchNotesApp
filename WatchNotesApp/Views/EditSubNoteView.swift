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
    var subNote: SubNote
    @State private var subNoteTitle: String
    @State private var subNoteContent: String
    
    init(viewModel: SubNoteViewModel, noteViewModel: NoteViewModel, note: Note, subNote: SubNote) {
        self.viewModel = viewModel
        self.noteViewModel = noteViewModel
        self.note = note
        self.subNote = subNote
        _subNoteTitle = State(initialValue: subNote.title)
        _subNoteContent = State(initialValue: subNote.content)
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
                    viewModel.updateSubNoteInNote(subNote: subNote, newTitle: subNoteTitle, newContent: subNoteContent)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Guardar")
                }
            }
            .navigationTitle("Editar subnota")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
