//
//  DownloadWithCombineBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/22.
//

import SwiftUI
import Combine

struct DownloadWithCombineBootcamp: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
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
    }
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // 1. create the publisher
        // 2. subscribe the publisher on background thread
        // 3. receive on main thread
        // 4. tryMap (check that the data is good)
        // 5. decode (decode data into Post)
        // 6. sink (put the item into our app)
        // 7. cancel (cancel subscription if needed)
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [Post].self, decoder: JSONDecoder())
            //.replaceError(with: [])
            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("finished!")
//                case .failure(let error):
//                    print("failure. error: \(error)")
//                }
                print("completion: \(completion)")
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
    
}

struct Post: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

#Preview {
    DownloadWithCombineBootcamp()
}
