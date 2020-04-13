//
//  SearchBar.swift
//  SearchBar
//
//  Created by Dhanraj Sudhir Chavan on 13/04/20.
//  Copyright © 2020 Dhanraj Chavan. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct SearchBar : UIViewRepresentable {
    
    @Binding var text : String
    
    class Coordinator : NSObject, UISearchBarDelegate {
        @Binding var text : String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            searchBar.showsCancelButton = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
            searchBar.endEditing(true)
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.placeholder = "Search names here"
        searchBar.textContentType = .username
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

extension UIView {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIApplication.shared.windows
            .first { $0.isKeyWindow}?
            .endEditing(true)
    }
    
}
