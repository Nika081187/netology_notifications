//
//  NotificationManager.swift
//  Navigation
//
//  Created by v.milchakova on 27.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationsService {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound, .provisional)
        
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()

        notificationContent.title = "Тест пуш"
        notificationContent.body = "Тело пуша"
        notificationContent.badge = NSNumber(value: 23)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent, trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Ошибка отправки уведомления: ", error)
            }
        }
    }
    
    func registerForLatestUpdatesIfPossible() {
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = 19
           
        let trigger = UNCalendarNotificationTrigger(
                 dateMatching: dateComponents, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "Ежедневное уведомление"
        content.body = "Посмотрите последние обновления"
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Ошибка отправки уведомления: ", error)
            }
        }
    }
}
