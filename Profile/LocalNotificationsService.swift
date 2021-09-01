////
////  NotificationManager.swift
////  Navigation
////
////  Created by v.milchakova on 27.08.2021.
////  Copyright © 2021 Artem Novichkov. All rights reserved.
////
//
//import Foundation
//import UserNotifications
//
//class LocalNotificationsService: NSObject {
//
////    var userNotificationCenter = UNUserNotificationCenter.current()
//
////    func requestNotificationAuthorization() {
////        userNotificationCenter.requestAuthorization(options: [.sound, .badge, .provisional]) {(accepted, error) in
////          if !accepted {
////            print("Notification access denied.")
////          }
////        }
////    }
////
//    func sendNotification() {
//
//        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .provisional]) {(accepted, error) in
//          if !accepted {
//            print("Notification access denied.")
//          }
//        }
//
//        let content = UNMutableNotificationContent()
//
//        content.title = "Тест пуш"
//        content.body = "Тело пуша"
//        content.badge = NSNumber(value: 23)
//        content.sound = UNNotificationSound.default
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            if settings.authorizationStatus != UNAuthorizationStatus.authorized {
//                print("Not Authorised")
////                fatalError()
//            }
//        }
//
//        let request = UNNotificationRequest(identifier: "testNotification", content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                print("Ошибка отправки уведомления: ", error)
//            }
//        }
//    }
//
//    func registerForLatestUpdatesIfPossible() {
//
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//        dateComponents.hour = 19
//
//        let trigger = UNCalendarNotificationTrigger(
//                 dateMatching: dateComponents, repeats: true)
//
//        let content = UNMutableNotificationContent()
//        content.title = "Ежедневное уведомление"
//        content.body = "Посмотрите последние обновления"
//        content.sound = .default
//
//        let uuidString = UUID().uuidString
//        let request = UNNotificationRequest(identifier: uuidString,
//                    content: content, trigger: trigger)
//
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.add(request) { (error) in
//            if let error = error {
//                print("Ошибка отправки уведомления: ", error)
//            }
//        }
//    }
//}
//
//extension LocalNotificationsService: UNUserNotificationCenterDelegate {
//
//    func userNotificationCenter(
//      _ center: UNUserNotificationCenter,
//      willPresent notification: UNNotification,
//      withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler(.alert)
//    }
//
//    func userNotificationCenter(
//      _ center: UNUserNotificationCenter,
//      didReceive response: UNNotificationResponse,
//      withCompletionHandler completionHandler: @escaping () -> Void) {
//
//      completionHandler()
//    }
//}
