//
//  NewsCoordinatorView.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

import SwiftUI

struct NewsCoordinatorView: View {
    @ObservedObject var coordinator: NewsCoordinator
    let screenFactory: ScreenFactory

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(spacing: 16) {
                Image(systemName: "newspaper.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(.blue)
                Text("Лента новостей")
                    .font(.headline)
                
                Button("Тест: Открыть новость #123") {
                    coordinator.openPost(id: "123")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Новости")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NewsFlowRoute.self) { route in
                // собираем экраны через фабрику, чтобы не связывать их
                switch route {
                case .postDetail(let id):
                    screenFactory.makePostDetailView(id: id)
                case .authorProfile(let id, let username):
                    screenFactory.makeAuthorProfileView(id: id, username: username)
                }
            }
        }
    }
}
