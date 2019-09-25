//
//  Tweet.swift
//  Mamoot!
//
//  Created by Alex Modroño Vara on 02/09/2019.
//  Copyright © 2019 Semiak, Lygre & JoeyPi. All rights reserved.
//

import Foundation

// MARK: - Tweet
public struct Tweet: Hashable, Codable, Identifiable {
	/// conformance to `Identifiable`
	/// I assume we are parsing these from JSON though, so we do not need to necessarily ensure this `id` immutability
	public var id: Int { hashValue }

    public let author: Profile
    public let date: Date
    public let comments: Int
    public let likes: Int
    public let retweets: Int
    public let content: String
    


    public init(author: Profile,
              date: Date,
              comments: Int,
              likes: Int,
              retweets: Int,
              content: String) {
    self.author = author
    self.date = date
    self.comments = comments
    self.likes = likes
    self.retweets = retweets
    self.content = content
  }
}

// MARK: - Examples
extension Tweet {
    static let exampleContents = ["iSO 69 jelbrek wen? eta son", "lmao iPhone 420 with 69 cameras now for only 999999€ and one lung. Pretty cheap!", "I sell flamethowers and sent a car to space because I'm rich lmao", "Hey, this is an example large tweet that will likely take all the 280 character limit Twitter has, but not the 500 characters limit of Mastodon.\n\nIt also has emojis 😉😴🇪🇸🥳"]
    
    static let exampleAuthors = [Profile(customName: "Apple", userName: "apple", instance: "twitter.com"), Profile(customName: "President & Senpai Elon Musk", userName: "elonmusk", instance: "twitter.com"), Profile(customName: "Pwn20wnd", userName: "pwn20wnd", instance: "twitter.com"), Profile(customName: "Jaime Bishop", userName: "jaimiebishop123", instance: "mastodon.social")]
    
    static let tweetExample = Tweet(author: exampleAuthors.randomElement()!, date: Date(), comments: Int.random(in: 0..<99999), likes: Int.random(in: 0..<99999), retweets: Int.random(in: 0..<99999), content: exampleContents.randomElement()!)

	static func generateSample(size: Int) -> [Tweet] {
		var sampleData = [Tweet]()
		for _ in 1...size {
			sampleData.append(.tweetExample)
		}
		return sampleData
	}

}

var exampleTweetViewModel = TweetViewModel(tweet: Tweet.tweetExample)
