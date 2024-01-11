//
//  SelectedSkill.swift
//  LingFitChecker
//
//  Created by tarupos_ on 2023/11/30.
//

import SwiftUI

struct SelectedSkillView: View {
    @ObservedObject var viewModel: SkillListViewModel
    let skillId: Int
    @State private var editedCount: String = ""
    @FocusState private var isInputActive: Bool // キーボードのフォーカス状態

    var body: some View {
        VStack {
            if let skillIndex = viewModel.skillList.firstIndex(where: { $0.id == skillId }) {
                let bindingCount = Binding<String>(
                    get: { String(self.viewModel.skillList[skillIndex].count) },
                    set: { self.editedCount = $0 }
                )

                Text(viewModel.skillList[skillIndex].nameJ)
                    .font(.title)
                    .padding()

                HStack {
                    // 減算ボタン
                    Button(action: {
                        decrementCount(skillIndex)
                    }) {
                        Image(systemName: "minus.circle")
                    }

                    // 数値入力フィールド
                    TextField("", text: bindingCount)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .frame(width: 80) // 6桁分のスペースを確保
                        .onChange(of: editedCount) { newValue in
                            if let newCount = Int(newValue) {
                                viewModel.updateCount(for: skillId, newCount: newCount)
                            }
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("完了") {
                                    isInputActive = false
                                }
                            }
                        }

                    // 加算ボタン
                    Button(action: {
                        incrementCount(skillIndex)
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
                .font(.title)
            }
        }
        .padding()
    }
    private func updateCount(_ skillIndex: Int) {
        if let newCount = Int(editedCount), newCount >= 0 {
            viewModel.updateCount(for: skillId, newCount: newCount)
        }
    }

    private func incrementCount(_ skillIndex: Int) {
        let newCount = viewModel.skillList[skillIndex].count + 1
        viewModel.updateCount(for: skillId, newCount: newCount)
    }

    private func decrementCount(_ skillIndex: Int) {
        let newCount = max(viewModel.skillList[skillIndex].count - 1, 0)
        viewModel.updateCount(for: skillId, newCount: newCount)
    }
}
