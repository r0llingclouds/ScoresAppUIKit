//
//  JSONLoader.swift
//  ScoresAppUIKit
//
//  Created by Tirso López Ausens on 15/3/25.
//

import Foundation

protocol JSONLoader {}

extension JSONLoader {
    func load<T>(url: URL, type: T.Type) throws -> T where T: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
}
