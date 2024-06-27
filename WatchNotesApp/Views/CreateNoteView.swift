//
//  CreateNoteView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct CreateNoteView: View {
    @ObservedObject var viewModel: NoteViewModel
    @State private var noteTitle: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nueva nota")) {
                    TextField("Título", text: $noteTitle)
                }
                
                Button(action: {
                    viewModel.addNote(title: noteTitle)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Guardar")
                }
            }
            .navigationTitle("Crear nota")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
