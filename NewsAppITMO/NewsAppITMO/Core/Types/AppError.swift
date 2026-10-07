//
//  AppError.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

enum AppError: Error, Equatable, Sendable {
    case networkUnavailable
    case serverUnavailable
    case invalidData
    case notFound
    case unknown(String)
}
