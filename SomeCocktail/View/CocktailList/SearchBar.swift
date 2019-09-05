//
//  SearchBar.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/4/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


struct SearchBar: UIViewRepresentable {
    var didChange: (String) -> Void

    class Coordinator: NSObject, UISearchBarDelegate {

        var didChange: (String) -> Void

        init(didChange: @escaping (String) -> Void) {
            self.didChange = didChange
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            didChange(searchText)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(didChange: self.didChange)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.barTintColor = .white
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: UIViewRepresentableContext<SearchBar>) {
//        uiView.text = text
    }
}
