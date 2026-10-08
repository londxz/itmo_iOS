//
//  TagDTO.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

import Foundation

nonisolated struct TagDTO: Decodable, Sendable {
    let id: Int
    let name: String
}
