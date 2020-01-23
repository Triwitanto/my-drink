//
//  LandmarkList.swift
//  Belajaraja
//
//  Created by namikaze on 08/11/19.
//  Copyright © 2019 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI


struct LandmarkList: View {
    
    @State var show = false
    
    var body: some View {
        ZStack{
            NavigationView{

                HomeView()
                    .navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(trailing:
                        Button(action: {
                            
                            self.show.toggle()

                        }, label: {
                            Image(systemName: "cart.fill").font(.body).foregroundColor(.black)
                    })
                )
            }
            
            if self.show{
                GeometryReader{_ in
                    
                    CartView()
                    
                }.background(
                    
                    Color.black.opacity(0.55)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.show.toggle()
                    }
                )
            }
        }.animation(.linear(duration: 1.0))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
