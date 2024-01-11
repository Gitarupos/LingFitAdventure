//
//  SkillListViewModel.swift
//  LingFitChecker
//
//  Created by tarupos_ on 2023/12/14.
//

import Foundation

class SkillListViewModel: ObservableObject {
    @Published var skillList: [SkillListOption] {
        didSet {
            saveToUserDefaults()
        }
    }

    init(skillList: [SkillListOption] = []) {
        if let data = UserDefaults.standard.data(forKey: "SkillList"),
           let savedSkills = try? JSONDecoder().decode([SkillListOption].self, from: data) {
            self.skillList = savedSkills
        } else {
            self.skillList = skillList
        }
    }

    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(skillList) {
            UserDefaults.standard.set(encoded, forKey: "SkillList")
        }
    }
    
    func updateCount(for skillId: Int, newCount: Int) {
            if let index = skillList.firstIndex(where: { $0.id == skillId }) {
                skillList[index].count = newCount
                objectWillChange.send() // ビューの更新をトリガー
            }
        }}


let SkillList: [SkillListOption] = [
    //うで
    SkillListOption(id: 0, nameJ: "ウシロプッシュ", nameE: "Back Press", tipe: 0, count: 0, area:1, damage:675),
    SkillListOption(id: 1, nameJ: "バンザイプッシュ", nameE: "Overhead Press", tipe: 0, count:100 , area:1, damage:655),
    SkillListOption(id: 2, nameJ: "サゲテプッシュ", nameE: "Front Press", tipe: 0, count: 500, area:3, damage:390),
    SkillListOption(id: 3, nameJ: "リングアロー", nameE: "Bow Pull", tipe: 0, count: 1000, area:5, damage:370),
    SkillListOption(id: 4, nameJ: "カタニプッシュ", nameE: "Shoulder Press", tipe: 0, count: 3000, area:0, damage:14),
    SkillListOption(id: 5, nameJ: "トライセプス", nameE: "Tricep Kickback", tipe: 0, count: 0, area:3, damage:430),
    SkillListOption(id: 6, nameJ: "アームツイスト", nameE: "Overhead Arm Twist", tipe: 0, count: 0, area:1, damage:705),
    SkillListOption(id: 7, nameJ: "グルグルアーム", nameE: "Overhead Arm Spin", tipe: 0, count: 0, area:5, damage:490),
    //はら
    SkillListOption(id: 8, nameJ: "バンザイサイドベント", nameE: "Overhead Side Bend", tipe: 1, count: 0, area:0, damage:14),
    SkillListOption(id: 9, nameJ: "バンザイツイスト", nameE: "Overhead Lunge Twist", tipe: 1, count: 0, area:1, damage:840),
    SkillListOption(id: 10, nameJ: "ベントオーバー", nameE: "Pendulum Bend", tipe: 1, count: 0, area:3, damage:560),
    SkillListOption(id: 11, nameJ: "バンザイモーニング", nameE: "Overhead Bend", tipe: 1, count: 0, area:1, damage:795),
    SkillListOption(id: 12, nameJ: "ニートゥーチェスト", nameE: "Knee-to-Chest", tipe: 1, count: 0, area:1, damage:700),
    SkillListOption(id: 13, nameJ: "マエニプッシュ", nameE: "Seated Forward Press", tipe: 1, count: 0, area:0, damage:15),
    SkillListOption(id: 14, nameJ: "プランク", nameE: "Plank", tipe: 1, count: 0, area:3, damage:485),
    SkillListOption(id: 15, nameJ: "レッグレイズ", nameE: "Leg Raise", tipe: 1, count: 0, area:1, damage:755),
    SkillListOption(id: 16, nameJ: "アシパカパカ", nameE: "Open&Close Leg Raise", tipe: 1, count: 0, area:0, damage:17),
    SkillListOption(id: 17, nameJ: "スワイショウ", nameE: "Standing Twist", tipe: 1, count: 0, area:5, damage:325),
    SkillListOption(id: 18, nameJ: "バンザイコシフリ", nameE: "Overhead Hip Shake", tipe: 1, count: 0, area:5, damage:395),
    SkillListOption(id: 19, nameJ: "ロシアンツイスト", nameE: "Russian Twist", tipe: 1, count: 0, area:5, damage:455),
    SkillListOption(id: 20, nameJ: "バタバタレッグ", nameE: "Flutter Kick", tipe: 1, count: 0, area:1, damage:625),
    SkillListOption(id: 21, nameJ: "リングアゲサゲ", nameE: "Seated Ring Raise", tipe: 1, count: 0, area:1, damage:545),
    SkillListOption(id: 22, nameJ: "ハサミレッグ", nameE: "Leg Scissors", tipe: 1, count: 0, area:3, damage:445),
    //あし
    SkillListOption(id: 23, nameJ: "スクワット", nameE: "Squat", tipe: 2, count: 0, area:1, damage:665),
    SkillListOption(id: 24, nameJ: "ワイドスクワット", nameE: "Wide Squat", tipe: 2, count: 0, area:3, damage:560),
    SkillListOption(id: 25, nameJ: "バンザイスクワット", nameE: "Overhead Squat", tipe: 2, count: 0, area:5, damage:325),
    SkillListOption(id: 26, nameJ: "モモデプッシュ", nameE: "Thigh Press", tipe: 2, count: 0, area:1, damage:615),
    SkillListOption(id: 27, nameJ: "ヒップリフト", nameE: "Hip Lift", tipe: 2, count: 0, area:0, damage:16),
    SkillListOption(id: 28, nameJ: "マウンテンクライマー", nameE: "Mountain Climber", tipe: 2, count: 0, area:5, damage:510),
    SkillListOption(id: 29, nameJ: "モモアゲアゲ", nameE: "Knee Lift", tipe: 2, count: 0, area:1, damage:615),
    SkillListOption(id: 30, nameJ: "ステップアップ", nameE: "Side Step", tipe: 2, count: 0, area:3, damage:545),
    SkillListOption(id: 31, nameJ: "アゲサゲコンボ", nameE: "Ring Raise Combo", tipe: 2, count: 0, area:1, damage:615),
    SkillListOption(id: 32, nameJ: "モモアゲコンボ", nameE: "Knee-Lift Combo", tipe: 2, count: 0, area:3, damage:490),
    //ヨガ
    SkillListOption(id: 33, nameJ: "椅子のポーズ", nameE: "Chair Pose", tipe: 3, count: 0, area:1, damage:655),
    SkillListOption(id: 34, nameJ: "立木のポーズ", nameE: "Tree Pose", tipe: 3, count: 0, area:1, damage:490),
    SkillListOption(id: 35, nameJ: "チョウツガイのポーズ", nameE: "Hinge Pose", tipe: 3, count: 0, area:3, damage:460),
    SkillListOption(id: 36, nameJ: "ねじり体側のポーズ", nameE: "Revolved Crescent Lunge Pose", tipe: 3, count: 0, area:1, damage:580),
    SkillListOption(id: 37, nameJ: "英雄１のポーズ", nameE: "Warrior I Pose", tipe: 3, count: 0, area:1, damage:580),
    SkillListOption(id: 38, nameJ: "英雄２のポーズ", nameE: "Warrior II Pose", tipe: 3, count: 0, area:5, damage:430),
    SkillListOption(id: 39, nameJ: "英雄３のポーズ", nameE: "Warrior III Pose", tipe: 3, count: 0, area:3, damage:440),
    SkillListOption(id: 40, nameJ: "扇のポーズ", nameE: "Fan Pose", tipe: 3, count: 0, area:0, damage:15),
    SkillListOption(id: 41, nameJ: "舟のポーズ", nameE: "Boat Pose", tipe: 3, count: 0, area:5, damage:495),
    SkillListOption(id: 42, nameJ: "折りたたむポーズ", nameE: "Standing Forward Fold", tipe: 3, count: 0, area:0, damage:19)
]


