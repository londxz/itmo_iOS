//
//  BlogTagModel.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

import Foundation

nonisolated struct BlogTagModel: Identifiable, Hashable, Sendable {
    let id: String
    let name: String

    var displayName: String {
        "#\(name)"
    }
}
