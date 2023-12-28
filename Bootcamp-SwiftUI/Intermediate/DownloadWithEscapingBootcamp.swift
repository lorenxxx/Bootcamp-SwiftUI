//
//  DownloadWithEscapingBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/22.
//

import SwiftUI

struct DownloadWithEscapingBootcamp: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
        .listStyle(.plain)
    }
}

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                print("Error: \(String(describing: error))")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data.")
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else {
//                print("Invalid response.")
//                return
//            }
//            
//            guard response.statusCode >= 200 && response.statusCode < 300 else {
//                print("Status code should be 2xx, but is \(response.statusCode)")
//                return
//            }
//            
//            print("Successfully download data.")
//            print(data)
//            
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
//            
//            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
//            DispatchQueue.main.async { [weak self] in
//                self?.posts.append(newPost)
//            }
//        }.resume()
        
        downloadData(fromURL: url) { data in
            guard let data = data else {
                print("No data return")
                return
            }
            
            guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(contentsOf: newPosts)
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            
            guard let data = data else {
                print("No data.")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response.")
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but is \(response.statusCode)")
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
    
}

struct PostModel: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

#Preview {
    DownloadWithEscapingBootcamp()
}
