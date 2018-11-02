//
//  ViewController.swift
//  TestAddingTitanFramework
//
//  Created by ANTON ULYANOV on 22.06.2018.
//  Copyright © 2018 medlinesoft. All rights reserved.
//

import UIKit
import TitanFramework
import UITextView_Placeholder

class ViewController: UIViewController {
    
    @IBOutlet weak var userDataTextView: UITextView!
    @IBOutlet weak var appointmentId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDataTextView.placeholder = "{\"deviceType\":\"IOS\",\"login\":\"zzz@zz.zz\",\"password\":\"1234\"}"
        // Do any additional setup after loading the view, typically from a nib.
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(self.onDoctorCallStarted),
//                                               name: .TMKDoctorCallStarted,
//                                               object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
//        var userData = AuthUserData(secretKey: "WHnnVKWLfEvZ3") // 47
        var userData = AuthUserData(secretKey: "Wnw21$$nl!sdf") //43
        userData.login = "zzzz@zz.zz"
        userData.password = "1234"
        
        if let jsonString = userDataTextView.text, userDataTextView.text != "" {
            let authUserDataForTest = AuthUserDataForTest(json: convertToDictionary(text: jsonString)!)
            userData = authUserDataForTest!.authUserData!
        }

        MimasManager.sharedInstance.api.login(authUserData: userData, onSuccess: {
            print("±±±±±1")
            MimasManager.sharedInstance.api.sendAPNSToken()
            self.showInfoAlert(message: "Успешно")
        }, onError: { error in
            print("±±±±±2 \(error)")
            self.showInfoAlert(message: error)
        })
    }
    
    @IBAction func startTMKTitanAction(_ sender: Any) {
        print("openChatAction")
        if let appointmentId = appointmentId.text {
            MimasManager.sharedInstance.requestPermissions()
            let chatVC = MimasManager.sharedInstance.getChatScreen(appointmentId)
            print("openChatAction chatVC = \(chatVC)")
            self.navigationController?.pushViewController(chatVC, animated: true)
        }
    }
    
    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    private func showInfoAlert(message: String) {
        let alertController = UIAlertController(title: "Авторизация", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
//    @objc func onDoctorCallStarted(notification: NSNotification) {
//        print(" TU TU TU TU ")
//        if let appointmentId = notification.object as? String {
//            DispatchQueue.main.async {
//                // Open chat
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let startViewController = storyboard.instantiateInitialViewController()
//                startViewController?.view.backgroundColor = .yellow
//                let chatVC = MimasManager.sharedInstance.getChatScreen(appointmentId)
//
//                if let navVC = startViewController as? UINavigationController {
//                    navVC.pushViewController(chatVC, animated: false)
//                } else {
//                    startViewController?.navigationController?.pushViewController(chatVC, animated: true)
//                }
//            }
//        }
//    }
}

