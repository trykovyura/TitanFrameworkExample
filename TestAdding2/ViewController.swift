//
//  ViewController.swift
//  TestAddingTitanFramework
//
//  Created by ANTON ULYANOV on 22.06.2018.
//  Copyright © 2018 medlinesoft. All rights reserved.
//

import UIKit
import TitanFramework
import Arcane
import UITextView_Placeholder

class ViewController: UIViewController {
    
    @IBOutlet weak var userDataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDataTextView.placeholder = "{\"deviceType\":\"IOS\",\"login\":\"zzz@zz.zz\",\"password\":\"1234\"}"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        var userData = AuthUserData(secretKey: "phaiNgahJai8")
        userData.login = "zzz@zz.zz"
        userData.password = "1234"
        
        if let jsonString = userDataTextView.text, userDataTextView.text != "" {
            let authUserDataForTest = AuthUserDataForTest(json: convertToDictionary(text: jsonString)!)
            userData = authUserDataForTest!.authUserData!
        }
        
        TitanManager.sharedInstance.authenticate(authUserData: userData, onSuccess: {
            print("±±±±±1")
            self.showInfoAlert(message: "Успешно")
        }, onError: { error in
            print("±±±±±2 \(error)")
            self.showInfoAlert(message: error)
        })
    }
    
    @IBAction func startTMKTitanAction(_ sender: Any) {
        let startViewController = TitanManager.sharedInstance.getStartScreen()
        self.navigationController?.pushViewController(startViewController!, animated: true)
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
}

