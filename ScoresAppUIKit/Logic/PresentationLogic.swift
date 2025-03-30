//
//  PresentationLogic.swift
//  ScoresAppUIKit
//
//  Created by Tirso López Ausens on 30/3/25.
//

import UIKit

struct PresentationLogic {
    
    static let shared = PresentationLogic()
    
    private init() {}
    
    func getListSubtitleCell(text: String, secondaryText: String, image: String) -> UIListContentConfiguration {
        
        var configuration = UIListContentConfiguration.subtitleCell()
        configuration.text = text
        configuration.secondaryText = secondaryText
        configuration.image = UIImage(named: image)
        return configuration
    }
    
    
}
