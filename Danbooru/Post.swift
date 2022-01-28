//
//  Post.swift
//  Danbooru
//
//  Created by Artem Abramov on 2022-01-28.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let fileURL: URL?
    let largeFileURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case id, fileURL = "file_url", largeFileURL = "large_file_url"
    }
}
