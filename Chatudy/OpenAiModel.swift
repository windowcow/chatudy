//
//  OpenAiModel.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import Foundation
import OpenAISwift

struct OpenAiModel {
    let openAI = OpenAISwift(authToken: "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")

    init() {
        openAI.sendCompletion(with: "Hello how are you", maxTokens: 100) { result in // Result<OpenAI, OpenAIError>
            switch result {
            case .success(let success):
                print(success.choices.first?.text ?? "")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

