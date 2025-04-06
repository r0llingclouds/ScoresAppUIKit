//
//  ModelLogic.swift
//  ScoresAppUIKit
//
//  Created by Tirso López Ausens on 23/3/25.
//

import Foundation
import UIKit

@MainActor
final class ModelLogic {
    static let shared = ModelLogic()
    
    private let repository: DataRepository
    private var scores: [Score] {
        didSet {
            try? repository.saveScores(scores)
        }
    }
    
    var numberOfSections: Int {
        Set(scores.map(\.composer)).count
    }
    
    private var scoresByComposer: [[Score]] {
        Dictionary(grouping: scores) { $0.composer }.values
            .sorted { $0.first?.composer ?? "" < $1.first?.composer ?? "" }
    }
    
    private init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.scores = try repository.getScores()
        } catch {
            scores = []
            print("Error loading scores: \(error)")
        }
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        scoresByComposer[section].count
    }
    
    func scoreForRowAt(_ indexPath: IndexPath) -> Score {
        scoresByComposer[indexPath.section][indexPath.row]
    }
    
    func titleForHeaderInSection(_ section: Int) -> String? {
        scoresByComposer[section].first?.composer
    }
    
    func deleteScoreAt(_ indexPath: IndexPath) {
        let score = scoresByComposer[indexPath.section][indexPath.row]
        scores.removeAll { $0.id == score.id }
        print("Deleted score: \(score.title)")
        print("Scores left: \(scores.count)")
    }
    
}

extension ModelLogic {
    static let test = ModelLogic(repository: RepositoryTest())
}
