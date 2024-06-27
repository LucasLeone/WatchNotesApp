//
//  HomeView.swift
//  WatchNotesApp Watch App
//
//  Created by Lucas Leone on 26/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = NoteViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.storedNotes) { note in
                    NavigationLink(
                        destination: NoteDetailView(
                            note: note, viewModel: viewModel)
                    ) {
                        Text(note.title)
                    }
                }
            }
            .navigationTitle("Notas")
        }
    }
}
