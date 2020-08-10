//
//  ContentView.swift
//  restapi-tutorial
//
//  Created by Gavin on 2020/08/10.
//  Copyright © 2020 Gavin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var postListVM = PostListViewModel()
    
    var body: some View {
        List(self.postListVM.posts, id: \.id) { post in
            VStack(alignment: .leading) {
                Text(post.title).font(.title)
                Text(post.body)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
