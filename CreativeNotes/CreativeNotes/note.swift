//
//  note.swift
//  CreativeNotes
//
//  Created by conner on 2/26/20.
//  Copyright © 2020 conner. All rights reserved.
//

import Foundation

struct note: Encodable, Decodable {
    var title: String
    var content: String? // Notes will always be initialized without content
    var inTrash: Bool
    var isPinned: Bool
    
    init(title: String, content: String?, inTrash: Bool = false, isPinned: Bool = false) {
        self.title = title
        self.content = content
        self.inTrash = inTrash   // Note will always started with these both false
        self.isPinned = isPinned
    }
}
