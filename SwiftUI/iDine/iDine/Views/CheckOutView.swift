//
//  CheckOutView.swift
//  iDine
//
//  Created by Aleksei Danilov on 19.04.2020.
//  Copyright © 2020 DanilovDev. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    static let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickupTime = 0
    
    private var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0..<Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine Loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(0..<Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Pickup Time")) {
                Picker("When pick up?", selection: $pickupTime) {
                    ForEach(0..<Self.pickupTimes.count) {
                        Text("\(Self.pickupTimes[$0])")
                    }
                }.pickerStyle(DefaultPickerStyle())
            }
            
            Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(
                title: Text("Order confirmed"),
                message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
