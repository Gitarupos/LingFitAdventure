//
//  ContentView.swift
//  LingFitChecker
//
//  Created by tarupos_ on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SkillListViewModel

    var body: some View {
        NavigationView {
            List {
                SkillCategorySection(categoryName: "うで", skills: filteredSkills(for: 0), viewModel: viewModel)
                SkillCategorySection(categoryName: "はら", skills: filteredSkills(for: 1), viewModel: viewModel)
                SkillCategorySection(categoryName: "あし", skills: filteredSkills(for: 2), viewModel: viewModel)
                SkillCategorySection(categoryName: "ヨガ", skills: filteredSkills(for: 3), viewModel: viewModel)
            }
            .navigationBarTitle("スキル一覧")
        }
    }

    private func filteredSkills(for tipe: Int) -> [SkillListOption] {
        viewModel.skillList.filter { $0.tipe == tipe }
    }
}

struct SkillCategorySection: View {
    var categoryName: String
    var skills: [SkillListOption]
    var viewModel: SkillListViewModel

    var body: some View {
        Section(header: Text(categoryName)) {
            ForEach(skills) { skill in
                NavigationLink(destination: SelectedSkillView(viewModel: viewModel, skillId: skill.id)) {
                    HStack{
                        SkillRow(viewModel: viewModel, skillId: skill.id)
                        Spacer()
                        Text("\(viewModel.skillList.first(where: { $0.id == skill.id })?.count ?? 0)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: 60, alignment: .trailing)
                    }
                }
            }
        }
    }
}

struct CrownView: View {
    var count: Int
    var skillId: Int
    let skillCountList: [SkillCountCheck]

    private var crownColor: Color {
        guard let countCheck = skillCountList.first(where: { $0.id == skillId }) else { return Color.clear }

        switch count {
        case let x where x >= countCheck.platinum:
            return Color(red: 170/255, green: 254/255, blue: 245/255)
        case let x where x >= countCheck.gold:
            return Color.yellow
        case let x where x >= countCheck.silver:
            return Color.gray
        case let x where x >= countCheck.bronze:
            return Color.brown
        default:
            return Color(red: 220/255, green: 220/255, blue: 220/255)
        }
    }

    var body: some View {
        Image(systemName: "crown.fill")
            .foregroundColor(crownColor)
    }
}




// スキルの行を表すビュー
struct SkillRow: View {
    @ObservedObject var viewModel: SkillListViewModel
        let skillId: Int

    var body: some View {
        if let skill = viewModel.skillList.first(where: { $0.id == skillId }) {
            HStack{
                CrownView(count: skill.count, skillId: skill.id, skillCountList: SkillCountList)
                VStack(alignment: .leading) {
                    Text(skill.nameJ)
                    //.lineLimit(1)
                        .foregroundColor(textColor(for: skill))
                    Text(skill.nameE)
                        .font(.subheadline)
                    //.lineLimit(1)
                        .foregroundColor(.gray)
                }
            }
        }
    }

    private func textColor(for skill: SkillListOption) -> Color {
        if skill.area == 0 {
            return Color(red: 255/255, green: 167/255, blue: 255/255)
        } else {
            switch skill.tipe {
            case 0: return .red
            case 1: return .yellow
            case 2: return .blue
            case 3: return .green
            default: return .black
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SkillListViewModel(skillList: SkillList))
    }
}
