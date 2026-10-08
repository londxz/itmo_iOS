//
//  Endpoint.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

import Foundation

nonisolated protocol Endpoint: Sendable {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
}

nonisolated extension Endpoint {
    var method: HTTPMethod { .get }
    var headers: [String: String] { [:] }
    var queryItems: [URLQueryItem] { [] }
}
