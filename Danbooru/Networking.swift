//
//  Networking.swift
//  Danbooru
//
//  Created by Artem Abramov on 2022-01-28.
//


//https://danbooru.donmai.us/wiki_pages/help:api
//https://testbooru.donmai.us/


//https://testbooru.donmai.us
//https://danbooru.donmai.us

import Foundation

enum NetworkError: Error {
    case IncorrectURL(String)
    case NoData
}

struct Networking {
    func getPosts(numberOfPosts: Int, page: Int = 1, debugPrint: Bool = false) async throws -> [Post] {
        let string = "https://testbooru.donmai.us/posts.json"
        guard let url = URL(string: string) else {
            throw NetworkError.IncorrectURL(string)
        }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if debugPrint { data.prettyPrintJSON() }
        
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts   
    }
}

extension Data {
    func prettyPrintJSON()  {
        do {
            let object = try JSONSerialization.jsonObject(with: self, options: [])
            let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
            guard let jsonString = String(data: data, encoding: .utf8) else {
                print("Unable to create a string from data")
                return
            }
            print(jsonString)
        } catch {
            print("Unable to serialize data for JSON output. Raw data:")
            if let string = String(data: self, encoding: .utf8) {
                print(string)
            }
            print(error)
        }
    }
}
