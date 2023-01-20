//
//  OnboardingMessage.swift
//  Damso
//
//  Created by 문정호 on 2023/01/18.
//

import Foundation


struct OnboardingMessage {
    let imgName: String
    let title: String
    let description: String
}

extension OnboardingMessage {
    static let messages: [OnboardingMessage]  = [
        OnboardingMessage(imgName: "Damso_onboarding1", title: "흡연구역 쉽게 찾아요!", description: "지도에서 흡연구역을 표시해드려요!"),
        OnboardingMessage(imgName: "Damso_onboarding2", title: "흡연구역 정보를 확인해요!", description: "지도에서 흡연구역을 터치하면 흡연구역의 정보를 볼 수 있어요!")
    ]
}
