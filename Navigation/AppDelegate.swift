//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import UserNotifications

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    private var mainCoordinator: MainCoordinator?
//    private let localNotificationsService = LocalNotificationsService()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainCoordinator = MainCoordinator(window: window)
        self.window = window
        self.mainCoordinator = mainCoordinator
        mainCoordinator.start()
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(
          UIApplication.backgroundFetchIntervalMinimum)
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .provisional]) {(accepted, error) in
          if !accepted {
            print("Notification access denied.")
          }
          else {
            let content = UNMutableNotificationContent()

            content.title = "Тест пуш"
            content.body = "Тело пуша"
            content.badge = NSNumber(value: 23)
            content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                if settings.authorizationStatus != UNAuthorizationStatus.authorized {
                    print("Not Authorised")
                }
            }

            let request = UNNotificationRequest(identifier: "testNotification", content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { (error) in
                if let error = error {
                    print("Ошибка отправки уведомления: ", error)
                }
            }
          }
        }
        

        
//        UNUserNotificationCenter.current().delegate = localNotificationsService
        
//        localNotificationsService.requestNotificationAuthorization()
//        localNotificationsService.sendNotification()
//        localNotificationsService.registerForLatestUpdatesIfPossible()

        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if let navController = window?.rootViewController as? UINavigationController {
            let viewController = navController.viewControllers[0] as! MyTabBarController
            
            viewController.fetch {
                viewController.updateUI()
                  completionHandler(.newData)
            }
        }
    }

    private func application(_ application: UIApplication, didReceive notification: UNNotificationRequest) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.content.userInfo is [String : AnyObject] {
        }
        completionHandler(.alert)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.content.userInfo is [String : AnyObject] {
        }
        completionHandler()
    }
}
