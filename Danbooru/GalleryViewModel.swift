//
//  GalleryViewModel.swift
//  Danbooru
//
//  Created by Artem Abramov on 2022-01-28.
//

import Foundation
import Combine

extension GalleryView {
    class GalleryViewModel: ObservableObject {
        @Published private(set) var posts: [Post] = []
        
        private let service: Networking = Networking() //TODO: DI
        
        func viewLoaded() {
            Task {
                self.posts = try await service.getPosts(numberOfPosts: 0, debugPrint: true)
            }
        }
    }
}
