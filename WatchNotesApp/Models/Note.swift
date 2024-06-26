//
//  Note.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import Foundation

struct Note: Identifiable {
    var id = UUID()
    var title: String
    var subNotes: [SubNote]
}
