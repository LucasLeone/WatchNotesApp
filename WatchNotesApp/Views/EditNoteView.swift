//
//  EditNoteView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: NoteViewModel
    var note: Note
    @State private var noteTitle: String
    
    init(viewModel: NoteViewModel, note: Note) {
        self.viewModel = viewModel
        self.note = note
        _noteTitle = State(initialValue: note.title)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Editar nota")) {
                    TextField("Título", text: $noteTitle)
                }
                
                Button(action: {
                    viewModel.updateNote(note: note, newTitle: noteTitle)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Guardar")
                }
            }
            .navigationTitle("Editar nota")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
