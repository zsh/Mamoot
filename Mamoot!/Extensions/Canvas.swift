//
//  Canvas.swift
//  Mamoot!
//
//  Created by Alex Modroño Vara on 08/09/2019.
//  Copyright © 2019 Semiak, Lygre & JoeyPi. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Canvas
/// A top level view with a background
struct Canvas<Content : View> : View {
    let content: Content
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .background(Color(UIColor(named: "backgroundColor")!))
        //.frame(width: UIScreen.main.bounds.width)
    }
}
