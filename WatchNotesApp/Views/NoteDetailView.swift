//
//  NoteDetailView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    @ObservedObject var viewModel: NoteViewModel
    @State private var showingCreateSubNoteView = false
    @State private var showingEditNoteView = false
    @State private var editMode = EditMode.inactive
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            ForEach(note.subNotes) { subNote in
                NavigationLink(destination: SubNoteDetailView(viewModel: SubNoteViewModel(subNote: subNote), noteViewModel: viewModel, note: note)) {
                    Text(subNote.title)
                }
            }
            .onDelete { indexSet in
                indexSet.forEach { index in
                    viewModel.removeSubNote(from: note, subNote: note.subNotes[index])
                }
            }
        }
        .navigationTitle(note.title)
        .navigationBarItems(
            leading: EditButton(),
            trailing: HStack {
                Button(action: {
                    showingEditNoteView.toggle()
                }) {
                    Image(systemName: "pencil")
                }
                Button(action: {
                    viewModel.removeNote(note: note)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                Button(action: {
                    showingCreateSubNoteView.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
        )
        .environment(\.editMode, $editMode)
        .sheet(isPresented: $showingCreateSubNoteView) {
            CreateSubNoteView(viewModel: viewModel, note: note)
        }
        .sheet(isPresented: $showingEditNoteView) {
            EditNoteView(viewModel: viewModel, note: note)
        }
    }
}
