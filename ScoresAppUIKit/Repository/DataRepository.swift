//
//  DataRepository.swift
//  ScoresAppUIKit
//
//  Created by Tirso López Ausens on 15/3/25.
//

import Foundation

struct Repository: DataRepository {}

protocol DataRepository: JSONLoader {
    var url: URL { get }
    func getScores() throws -> [Score]
}

extension DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "scoresdata",
                        withExtension: "json")!
    }
    
    func getScores() throws -> [Score] {
        try load(url: url, type: [Score].self)
    }
}
