//
//  CellView.swift
//  Belajaraja
//
//  Created by namikaze on 23/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct CellView: View {
    var data: DrinkRespon
    @State var show = false

    var body: some View{
        VStack{
            AnimatedImage(url: URL(string:
                data.imageName)!).resizable().frame(height: 270)

            HStack{
                VStack(alignment: .leading){
                    Text(data.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(data.price)
                        .fontWeight(.heavy)
                        .font(.body)
                }

                Spacer()
                Button(action: {
                    self.show.toggle()
                }){
                    Image(systemName: "arrow.right")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding(14)
                }.background(Color.yellow)
                .clipShape(Circle())
            }.padding(.horizontal)
                .padding(.bottom, 6)
        }.background(Color.white)
        .cornerRadius(20)
            .sheet(isPresented: self.$show) {
                OrderView(data: self.data)
        }
    }
}

//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
////        CellView()
//    }
//}
