//
//  HTTPClient.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

import Foundation

nonisolated protocol HTTPClient: Sendable {
    func send<T: Decodable & Sendable>(_ endpoint: any Endpoint) async throws -> T
}
