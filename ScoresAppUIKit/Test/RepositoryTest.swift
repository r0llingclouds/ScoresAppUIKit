//
//  RepositoryTest.swift
//  ScoresAppUIKit
//
//  Created by Tirso López Ausens on 23/3/25.
//

import Foundation
import UIKit

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "scoresdatatest",
                        withExtension: "json")!
    }
    
    var urlDoc: URL {
        URL.documentsDirectory.appending(path: "scoresdatatest").appendingPathExtension("json")
    }
    
    func saveScores(_ scores: [Score]) throws {}
        
    
}

extension ScoreTableViewControllerD {
    static var preview: UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nc = storyboard.instantiateInitialViewController() as! UINavigationController
        let vc = nc.viewControllers.first as! ScoreTableViewControllerD
        vc.logic = ModelLogic.test
        return UINavigationController(rootViewController: vc)
    }
    
}
    
