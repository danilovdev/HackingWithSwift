//
//  Favorites.swift
//  iDine
//
//  Created by Aleksei Danilov on 21.04.2020.
//  Copyright © 2020 DanilovDev. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    
    @Published var items = [MenuItem]()
    
    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func isFavorite(item: MenuItem) -> Bool {
        let index = items.firstIndex(of: item)
        return index != nil
    }
}
