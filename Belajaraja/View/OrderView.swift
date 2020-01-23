//
//  OrderView.swift
//  Belajaraja
//
//  Created by namikaze on 23/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct OrderView : View {
    var data : DrinkRespon
    @State var cash = false
    @State var quick = false
    @State var quantity = 0
    @Environment(\.presentationMode) var presentation

    var body : some View{

        VStack(alignment: .leading, spacing: 15){
            AnimatedImage(url: URL(string: data.imageName)!)
            .resizable()
                .frame(height: UIScreen.main.bounds.height / 2 - 100)

            VStack(alignment: .leading, spacing: 15){
                Text(data.name).fontWeight(.heavy).font(.title)
                Text(data.price).fontWeight(.heavy).font(.body)
                Text(data.desc).fontWeight(.heavy).font(.caption)

                Toggle(isOn : $cash){
                    Text("Cash On Delivery")
                }

                Toggle(isOn : $quick){
                    Text("Quick Delivery")
                }

                Stepper(onIncrement: {

                    self.quantity += 1

                }, onDecrement: {
                    if self.quantity != 0 {
                        self.quantity -= 1
                    }
                }) {
                    Text("Quantity \(self.quantity)")
                }

                Button(action: {
                    let db = Firestore.firestore()
                    db.collection("cart")
                    .document()
                    .setData(
                        ["item":self.data.name, "quantity":self.quantity, "cashondelivery":self.cash,
                     "quickdelivery":self.quick,"imageName":self.data.imageName]) { (err) in
                        if err != nil{

//                            print((err?.localizedDescription))
                            return
                        }
                        self.presentation.wrappedValue.dismiss()

                    }
                }) {
                    Text("Add To Card")
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                }.background(Color.orange)
                    .foregroundColor(.white)
                .cornerRadius(20)
            }.padding()
        }
    }
}

//struct OrderView_Previews: PreviewProvider {
//    static var previews: some View {
////        OrderView()
//    }
//}
