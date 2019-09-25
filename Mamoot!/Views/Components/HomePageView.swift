//
//  HomePageView.swift
//  Mamoot!
//
//  Created by Alex Modroño Vara on 02/09/2019.
//  Copyright © 2019 Semiak, Lygre & JoeyPi. All rights reserved.
//

import SwiftUI

struct HomePageView: View {

	var tweets: [Tweet]

    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                ForEach(tweets.map({
                    TweetViewModel(tweet: $0)
                }), id: \.self) { tweetVM in
                    Group {
                        
                        TweetView(model: tweetVM)
                            .padding(.top)
                        
                        Divider()
                            .padding(.leading)
                    }
                }
            }
                
            .navigationBarTitle("Your feed")
            .navigationBarItems(trailing: Button(action: {  }) {
                Image(systemName: "gear")
                    .font(.title)
            })
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
		HomePageView(tweets: Tweet.generateSample(size: 5))
    }
}
