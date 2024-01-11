//
//  LingFitCheckerApp.swift
//  LingFitChecker
//
//  Created by tarupos_ on 2023/08/18.
//

import SwiftUI

@main
struct LingFitCheckerApp: App {
    let viewModel = SkillListViewModel(skillList: SkillList)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
