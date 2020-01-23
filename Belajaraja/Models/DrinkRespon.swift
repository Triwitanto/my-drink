//
//  DrinkRespon.swift
//  Belajaraja
//
//  Created by namikaze on 17/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI

struct DrinkRespon: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var desc: String
    var imageName: String
    var price: String
}

extension DrinkRespon {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
