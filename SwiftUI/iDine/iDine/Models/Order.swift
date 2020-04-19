//
//  Order.swift
//  iDine
//
//  Created by Aleksei Danilov on 19.04.2020.
//  Copyright © 2020 DanilovDev. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    
    @Published var items = [MenuItem]()
    
    var total: Int {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
