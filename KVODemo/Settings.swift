//
//  Settings.swift
//  KVODemo
//
//  Created by Oscar Victoria Gonzalez  on 4/7/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

// Settings is to ve KVO- compliant
@objc class Settings: NSObject {
   static var shared = Settings()
    @objc dynamic var fontSize: Int
    @objc dynamic var iconName: String
    override private init() {
        fontSize = 17
        iconName = "sun.haze.fill"
    }
}
