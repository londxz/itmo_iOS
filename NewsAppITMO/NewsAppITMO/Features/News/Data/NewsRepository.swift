//
//  NewsRepository.swift
//  NewsAppITMO
//
//  Created by n.a.grebenkin on 08.10.2026.
//

import Foundation
import OSLog

nonisolated protocol NewsRepository: Sendable {
    func fetchDayTopPost() async throws -> PostModel?
    func fetchFreshPosts(page: Int, perPage: Int) async throws -> [PostModel]
}

actor NewsRepositoryImpl: NewsRepository {
    private let client: any HTTPClient
    private let logger = Logger(subsystem: "NewsAppITMO", category: "NewsRepository")

    init(client: any HTTPClient) {
        self.client = client
    }

    func fetchDayTopPost() async throws -> PostModel? {
        logger.debug("▶︎ новость дня: старт, main thread = \(Thread.isMainThread)")
        let dtos: [ArticleDTO] = try await client.send(NewsEndpoint.dayTop)
        logger.debug("✓ новость дня: ответ получен")
        return dtos.first.map(ArticleMapper.toDomain)
    }

    func fetchFreshPosts(page: Int, perPage: Int) async throws -> [PostModel] {
        logger.debug("▶︎ свежие новости (стр. \(page)): старт, main thread = \(Thread.isMainThread)")
        let dtos: [ArticleDTO] = try await client.send(NewsEndpoint.fresh(page: page, perPage: perPage))
        logger.debug("✓ свежие новости (стр. \(page)): ответ получен, \(dtos.count) шт.")
        return dtos.map(ArticleMapper.toDomain)
    }
}
