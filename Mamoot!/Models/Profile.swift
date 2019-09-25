//
//  Profile.swift
//  Mamoot!
//
//  Created by Alex Modroño Vara on 07/09/2019.
//  Copyright © 2019 Semiak, Lygre & JoeyPi. All rights reserved.
//

import Foundation

// MARK: Profile
public struct Profile: Hashable, Codable, Identifiable {
    let customName: String
    let userName: String
    let instance: String?
    
    public var id: Int { hashValue }
    
    public init(customName: String,
                userName: String,
                instance: String?) {
      self.customName = customName
      self.userName = userName
      self.instance = instance
    }
}
