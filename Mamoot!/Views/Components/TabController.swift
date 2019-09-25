//
//  ContentView.swift
//  Mamoot!
//
//  Created by Alex Modroño Vara on 02/09/2019.
//  Copyright © 2019 Semiak, Lygre & JoeyPi. All rights reserved.
//

import SwiftUI

struct TabController: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            // TODO: This needs to be changed.
            /// We'll inject an object into the environment here, rather than passing static data
            HomePageView(tweets: [.tweetExample])
                .tabItem {
                    Image(systemName: "house.fill")
                        .font(.title)
                }
                .tag(0)
            
            Text("Second View")
                .font(.title)
                .tabItem {
                    Image(systemName: "bell.fill")
                        .font(.title)
                }
                .tag(1)
        }
            .edgesIgnoringSafeArea(.top)
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
    }
}
