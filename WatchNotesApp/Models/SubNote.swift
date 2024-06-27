//
//  SubNote.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 26/06/2024.
//

import Foundation

struct SubNote: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}
