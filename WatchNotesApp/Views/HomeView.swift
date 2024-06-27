//
//  HomeView.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = NoteViewModel()
    @State private var showingCreateNoteView = false
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.storedNotes) { note in
                    NavigationLink(destination: NoteDetailView(note: note, viewModel: viewModel)) {
                        Text(note.title)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        viewModel.removeNote(note: viewModel.notes[index])
                    }
                }
            }
            .navigationTitle("Notas")
            .navigationBarItems(
                trailing: HStack {
                    EditButton()
                    Button(action: {
                        showingCreateNoteView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            )
            .environment(\.editMode, $editMode)
            .sheet(isPresented: $showingCreateNoteView) {
                CreateNoteView(viewModel: viewModel)
            }
        }
    }
}
