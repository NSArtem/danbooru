//
//  ContentView.swift
//  Danbooru
//
//  Created by Artem Abramov on 2022-01-28.
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var viewModel: GalleryViewModel
    var body: some View {
        VStack {
            ForEach(viewModel.posts) { post in
                Text(String(post.id))
            }
        }
        .onAppear {
            viewModel.viewLoaded()
        }
    }
}

extension GalleryView {
    func loadData() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(viewModel: GalleryView.GalleryViewModel())
    }
}
