//
//  getDrink.swift
//  Belajaraja
//
//  Created by namikaze on 23/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

class getDrink : ObservableObject{
    @Published var dates = [DrinkRespon]()
    
    init(){
        let db = Firestore.firestore()
        db.collection("drink").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }

            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let desc = i.document.get("desc") as! String
                let imageName = i.document.get("imageName") as! String
                let price = i.document.get("price") as! String

                print(name)

                self.dates.append(DrinkRespon(id: id, name: name, desc: desc, imageName: imageName, price: price))
            }
        }
    }
}
