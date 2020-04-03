//
//  DetailViewModel.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 03/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

struct DetailViewModel {
    let id: Int
    let name: String
    let appearences: [String]
    let url: String
    let created: String
    
    var appearencesLabel:String {
        return self.appearences.reduce("") { (result, appearence) -> String in
            return result  + ", " + appearence
        }
    }
}
