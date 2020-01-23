//
//  ContentView.swift
//  Belajaraja
//
//  Created by namikaze on 08/11/19.
//  Copyright © 2019 namikaze. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var drink: DrinkRespon

    var body: some View {
        VStack {
//            MapView(coordinate: landmark.locationCoordinate)
//                .frame(height: 300)

            CircleImage(image: drink.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(drink.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(drink.desc)
                        .font(.subheadline)
                    Spacer()
                    Text(drink.price)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(verbatim: drink.name), displayMode: .inline)
    }
}
