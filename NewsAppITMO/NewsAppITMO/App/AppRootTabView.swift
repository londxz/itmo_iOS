//
//  AppRootTabView.swift
//  NewsAppITMO
//
//  Created by Родион Холодов on 07.10.2026.
//

import SwiftUI

struct AppRootTabView: View {
    @ObservedObject var coordinator: AppCoordinator
    let container: AppContainer
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            
            // Новости
            NavigationStack {
                VStack(spacing: 12) {
                    Image(systemName: "newspaper.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.blue)
                    Text("Здесь будет лента новостей")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Новости")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Новости", systemImage: "newspaper")
            }
            .tag(AppTab.news)
            
            // Блог
            NavigationStack {
                VStack(spacing: 12) {
                    Image(systemName: "doc.text.image.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.orange)
                    Text("Здесь будут статьи блога")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Блог")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Блог", systemImage: "doc.text.image")
            }
            .tag(AppTab.blog)
            
            // Закладки
            NavigationStack {
                VStack(spacing: 12) {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.purple)
                    Text("Здесь будут сохраненные статьи")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Закладки")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Закладки", systemImage: "bookmark")
            }
            .tag(AppTab.bookmarks)
            
            // Настройки
            NavigationStack {
                VStack(spacing: 12) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.gray)
                    Text("Здесь будут настройки приложения")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Настройки")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Настройки", systemImage: "gearshape")
            }
            .tag(AppTab.settings)
        }
    }
}
