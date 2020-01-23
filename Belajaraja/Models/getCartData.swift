//
//  getCartData.swift
//  Belajaraja
//
//  Created by namikaze on 23/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

class getCartData : ObservableObject{
    @Published var datas = [CartRespon]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("cart").addSnapshotListener { (snap, err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                if i.type == .added{
                    let id = i.document.documentID
                    let item = i.document.get("item") as! String
                    let quantity = i.document.get("quantity") as! NSNumber
                    let imageName = i.document.get("imageName") as! String

                    print(item)

                    self.datas.append(CartRespon(id: id, item: item, quantity: quantity, imageName: imageName))
                }
                
                if i.type == .modified{
                    let id = i.document.documentID
                    let quantity = i.document.get("quantity") as! NSNumber
                    
                    for j in 0..<self.datas.count{
                        if self.datas[j].id == id {
                            self.datas[j].quantity = quantity
                        }
                    }
                }
            }
            
        }
    }
}





