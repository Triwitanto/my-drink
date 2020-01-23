//
//  Loader.swift
//  Belajaraja
//
//  Created by namikaze on 23/01/20.
//  Copyright © 2020 namikaze. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct Loader : UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<Loader>) ->
        UIActivityIndicatorView {

            let indicator = UIActivityIndicatorView(style : .large)
            indicator.startAnimating()
            return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context:
        UIViewRepresentableContext<Loader>) {
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
