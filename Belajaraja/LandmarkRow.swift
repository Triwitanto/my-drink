//
//  LandmarkRow.swift
//  Belajaraja
//
//  Created by namikaze on 08/11/19.
//  Copyright © 2019 namikaze. All rights reserved.
//

import SwiftUI
import Firebase

struct LandmarkRow: View {
    var drink: DrinkRespon

    var body: some View {
        
//        Home()
        
        HStack {
            drink.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(drink.name)
                .modifier(Title())
        }
    }
}

//struct LandmarkRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LandmarkRow(landmark: landmarkData[0])
//                .previewLayout(.fixed(width: 300, height: 70))
//            LandmarkRow(landmark: landmarkData[1])
//                .previewLayout(.fixed(width: 300, height: 70))
//        }
//    }
//}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//struct Home: View {
//
//    @ObservedObject var hokage = getHokage()
//
//    var body: some View {
//        VStack{
//            List(hokage.dates){i in
//                Text(i.name)
//
//            }
//        }
//    }
//}
//
//class getHokage : ObservableObject{
//    @Published var dates = [hokageKonoha]()
//
//    init(){
//        let db = Firestore.firestore()
//        db.collection("hokage").addSnapshotListener { (snap, err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//
//            for i in snap!.documentChanges{
//                let id = i.document.documentID
//                let name = i.document.get("name") as! String
//                let image = i.document.get("image") as! String
//                let desc = i.document.get("desc") as! String
//
//                print(name)
//
//
//                self.dates.append(hokageKonoha(id: id, name: name, image: image, desc: desc))
//            }
//        }
//    }
//}
//
//struct hokageKonoha : Identifiable {
//    var id : String
//    var name : String
//    var image : String
//    var desc : String
//}
//

