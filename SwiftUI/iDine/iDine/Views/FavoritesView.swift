//
//  FavoritesView.swift
//  iDine
//
//  Created by Aleksei Danilov on 22.04.2020.
//  Copyright © 2020 DanilovDev. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.items) { item in
                    ItemRow(item: item)
                }
            }.navigationBarTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
