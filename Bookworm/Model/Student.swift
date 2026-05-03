//
//  Student.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 5/3/26.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
