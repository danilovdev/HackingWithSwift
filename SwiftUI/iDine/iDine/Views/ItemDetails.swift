//
//  ItemDetails.swift
//  iDine
//
//  Created by Aleksei Danilov on 19.04.2020.
//  Copyright © 2020 DanilovDev. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                .offset(x: -25, y: -5)
                
            }
            Text(item.description)
                .padding(.top, 10)
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
            Button("Order this") {
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetails(item: MenuItem.example).environmentObject(order)
        }
    }
}
