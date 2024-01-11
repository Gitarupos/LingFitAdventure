//
//  SkillListOption.swift
//  LingFitChecker
//
//  Created by tarupos_ on 2023/12/14.
//

import Foundation

class SkillListOption: Codable, Identifiable {
    let id:     Int
    let nameJ:  String
    let nameE:  String
    let tipe:   Int
    var count:  Int
    let area:   Int
    let damage: Int

    init(id: Int, nameJ: String, nameE: String, tipe: Int, count: Int, area: Int, damage: Int) {
        self.id     = id
        self.nameJ  = nameJ
        self.nameE  = nameE
        self.tipe   = tipe
        self.count  = count
        self.area   = area
        self.damage = damage
    }
}


