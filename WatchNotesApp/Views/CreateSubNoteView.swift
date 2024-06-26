//
//  CreateSubNoteView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct CreateSubNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: NoteViewModel
    var note: Note
    @State private var subNoteTitle: String = ""
    @State private var subNoteContent: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nueva subnota")) {
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
                    viewModel.addSubNote(to: note, title: subNoteTitle, content: subNoteContent)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Guardar")
                }
            }
            .navigationTitle("Crear subnota")
        }
    }
}
