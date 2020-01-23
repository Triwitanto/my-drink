//
//  HomeView.swift
//  Belajaraja
//
//  Created by namikaze on 23/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct HomeView: View {
    @ObservedObject var drinks = getDrink()

    var body: some View {
//                NavigationView{
//                    List(drinks.dates) { drink in
//                        NavigationLink(destination: LandmarkDetail(drink: drink)){
//                            LandmarkRow(drink: drink)
//                        }
//                    }
//                .navigationBarTitle(Text("Landmarks"))
//                }
        VStack{
            if self.drinks.dates.count != 0 {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 15){
                        ForEach(self.drinks.dates){i in
                            CellView(data: i)
                        }
                    }.padding()
                }.background(Color("Color").edgesIgnoringSafeArea(.all))
            }
            else {
                Loader()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
