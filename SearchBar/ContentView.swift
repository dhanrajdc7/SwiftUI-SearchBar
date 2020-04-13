//
//  ContentView.swift
//  SearchBar
//
//  Created by Dhanraj Sudhir Chavan on 13/04/20.
//  Copyright © 2020 Dhanraj Chavan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let studentsNames = ["Dhanraj", "Prathmesh", "Rohit", "Kshitij", "Abhishek", "Mandar", "Shailesh", "Gitesh"]
    
    @State private var searchText : String = ""
    
    var body: some View {
        NavigationView {
            List {
                
                SearchBar(text: $searchText)
                
                ForEach(studentsNames.filter({ self.searchText.isEmpty ? true : $0.lowercased().contains(searchText.lowercased())}), id: \.self) { student in
                    Text(student)
                }
            }
            .navigationBarTitle("Students List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
