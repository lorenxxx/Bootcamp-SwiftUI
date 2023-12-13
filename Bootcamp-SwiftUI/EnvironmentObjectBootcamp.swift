//
//  EnvironmentObjectBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/13.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append("iPhone")
        self.dataArray.append("iPad")
        self.dataArray.append("MacBook Pro")
        self.dataArray.append(contentsOf: ["Vision Pro", "iMac"])
    }
     
}

struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("Apple Devices")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            NavigationLink(
                destination: FinalView()) {
                    Text(selectedItem)
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(20.0)
                }
        }
    }
    
}

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.yellow, .pink],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundStyle(.white)
                .font(.title)
            }
        }
    }
    
}

#Preview {
    EnvironmentObjectBootcamp()
    //DetailView()
    //FinalView()
}
