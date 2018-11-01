//
//  AppDelegate.swift
//  TestAddingTitanFramework
//
//  Created by ANTON ULYANOV on 22.06.2018.
//  Copyright © 2018 medlinesoft. All rights reserved.
//

import UIKit
import TitanFramework
import UserNotifications
import PushKit
import CallKit
import XCGLogger

let log2 = XCGLogger.default

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initLogger()
        log2.debug("start init")
        
        // Override point for customization after application launch.
        MimasManager.sharedInstance.initialize(window, application, ExampleTheme())
        MimasManager.sharedInstance.initPush()
        MimasManager.sharedInstance.setPushDelegate(self)
//        voipRegistration()
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            let temp = MimasManager.sharedInstance.getNotificationCategory()
            log2.debug("temp = \(temp)")
            center.requestAuthorization(options: [.alert, .sound,. badge]) { (granted, error) in
                if (granted) {
                    print("User notifications granted")

                    center.setNotificationCategories([temp])

                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.registerForRemoteNotifications()
                    })
                } else {
                    print("User notifications access DENIED")
                    print("error = \(error)")
                }
            }
            center.removeAllPendingNotificationRequests()
            center.removeAllDeliveredNotifications()
        }
//        MimasManager.sharedInstance.initNotifications()
//        MimasManager.sharedInstance.setLogLevel(.error)
        log2.debug("finish init")
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(self.onDoctorCallStarted),
//                                               name: Notification.Name("TMKDoctorCallStarted"), //.TMKDoctorCallStarted,
//                                               object: nil)
        
        return true
    }

    func initLogger() {
        let logPath: URL = cacheDirectory.appendingPathComponent("ExampleLog.txt")
        let fileDestination = AutoRotatingFileDestination(writeToFile: logPath, identifier: "advancedLogger.fileDestination",
                                                          shouldAppend: true,
                                                          attributes: [.protectionKey: FileProtectionType.completeUntilFirstUserAuthentication])
        fileDestination.outputLevel = .debug
        fileDestination.showLogIdentifier = false
        fileDestination.showFunctionName = true
        fileDestination.showThreadName = true
        fileDestination.showLevel = true
        fileDestination.showFileName = true
        fileDestination.showLineNumber = true
        fileDestination.showDate = true
        fileDestination.logQueue = XCGLogger.logQueue
        fileDestination.targetMaxLogFiles = 10
        
        log2.add(destination: fileDestination)
    }
    
    public func voipRegistration() {
        let voipRegistry: PKPushRegistry = PKPushRegistry(queue: DispatchQueue.main)
        voipRegistry.delegate = self
        voipRegistry.desiredPushTypes = [PKPushType.voIP]
        print(" >>>>> voipRegistry = \(voipRegistry)")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        MimasManager.sharedInstance.processCallStartNotification(notification)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        MimasManager.sharedInstance.initializeYandexMetrica(deviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        MimasManager.sharedInstance.handlePushNotification(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        MimasManager.sharedInstance.handlePushNotification(userInfo)
        completionHandler(.newData)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {

    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        log2.debug(" >>>>>>> didReceive <<<<<<< ")
        MimasManager.sharedInstance.processUserNotification(response: response, completionHandler: completionHandler)
    }
}

extension AppDelegate: PKPushRegistryDelegate {
    public func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        log2.debug(" <><><> 1")
        let voipToken = pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined()
        MimasManager.sharedInstance.api.sendAPNSToken(voipToken)
        log2.debug("voip token: \(voipToken)")
    }

    public func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType) {
        log2.debug(" <><><> 2")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateInitialViewController()
        MimasManager.sharedInstance.setRootViewController(startViewController!)
    }

    public func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        log2.debug(" <><><> 3")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateInitialViewController()
        MimasManager.sharedInstance.setRootViewController(startViewController!)
    }

    public func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
        log2.debug(" <><><> 4")
    }
}

extension AppDelegate {
    @objc func onDoctorCallStarted(notification: NSNotification) {
        if let appointmentId = notification.object as? String {
            DispatchQueue.main.async {
                // Open chat
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let startViewController = storyboard.instantiateInitialViewController()
                startViewController?.view.backgroundColor = .yellow
                let chatVC = MimasManager.sharedInstance.getChatScreen(appointmentId)

                if let navVC = startViewController as? UINavigationController {
                    navVC.pushViewController(chatVC, animated: false)
                } else {
                    startViewController?.navigationController?.pushViewController(chatVC, animated: true)
                }

            }
        }
    }
}
