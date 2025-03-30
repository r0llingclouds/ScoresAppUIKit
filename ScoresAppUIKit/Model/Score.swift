//
//  Score.swift
//  ScoresAppUIKit
//
//  Created by Tirso López Ausens on 15/3/25.
//

import Foundation

struct Score: Codable {
    let id: Int
    let title: String
    let composer: String
    let year: Int
    let length: Double
    let cover: String
    let tracks: [String]
}
