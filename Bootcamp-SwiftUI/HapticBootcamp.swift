//
//  HapticBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/19.
//

import SwiftUI

struct HapticBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("notification-success") { HapticManager.instance.notification(type: .success) }
            Button("notification-warning") { HapticManager.instance.notification(type: .warning) }
            Button("notification-error") { HapticManager.instance.notification(type: .error) }
            
            Divider()
            
            Button("impact-heavy") { HapticManager.instance.impact(style: .heavy) }
            Button("impact-light") { HapticManager.instance.impact(style: .light) }
            Button("impact-medium") { HapticManager.instance.impact(style: .medium) }
            Button("impact-rigid") { HapticManager.instance.impact(style: .rigid) }
            Button("impact-soft") { HapticManager.instance.impact(style: .soft) }
            
        }
    }
}

class HapticManager {

    // Singleton
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

#Preview {
    HapticBootcamp()
}
