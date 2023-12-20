//
//  LocalNotificationBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/20.
//

import SwiftUI
import UserNotifications
import CoreLocation

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Authorization") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("Schedule Notification") {
                NotificationManager.instance.shceduleNotification()
            }
            
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().setBadgeCount(0) // not work
        })
    }
}

class NotificationManager {
    
    // Singleton
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let err = error {
                print("ERROR: \(err.localizedDescription)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func shceduleNotification() {
        // Build content
        let content = UNMutableNotificationContent()
        content.title = "My First Notification"
        content.subtitle = "This is subtitle"
        content.sound = .default
        content.badge = 1
        
        // Trigger
        // 1 - time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // 2 - calender
        //let dateComponent = DateComponents(hour: 15, minute: 19)
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // 3 - location
        let coordinate = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinate,
            radius: 100,
            identifier: UUID().uuidString
        )
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
    
        // Send content
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let err = error {
                print("ERROR: \(err.localizedDescription)")
            }
        }
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

#Preview {
    LocalNotificationBootcamp()
}
