//
//  ExampleTheme.swift
//  TMKTitanFramework_Example
//
//  Created by antony on 18.12.2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import TitanFramework

class ExampleTheme: NSObject, TMKTheme {

    func getItunesAppId() -> String {
        return "1316496574"
    }
    
    func getImageLogoVertical() -> String {
        return "logoVertical.png"
    }
    
    func getPrivacyURL() -> URL? {
        return URL(string: "http://medline.doctor/privacy/")!
    }
    
    func getProductionServer() -> String {
        return "https://telemed.medlinesoft.ru:8443"
    }
    
    func getSupportPhone() -> String {
        return "8 (800) 500-69-79"
    }
    
    
    func getImageLogoHeader() -> String {
        return "logo_header.png"
    }
    
    func tintColor() -> UIColor {
        return .TMKOrange
    }
    
    func mainColor() -> UIColor {
        return .TMKOrange
    }
    
    func secondColor() -> UIColor {
        return UIColor(red: 0x3F, green: 0x92, blue: 0x3F, opacity: 1)
    }
    
    func registrationButtonStyle() -> ComponentStyle {
        return ComponentStyle(UIColor.init(red: 199, green: 199, blue: 199, opacity: 1), UIColor.clear)
    }
    
    func isOneDutyDoctor() -> Bool {
        return true
    }
    
    func isNameRequiredOnRegistration() -> Bool {
        return true
    }
    
    func isShowTimeToAppointment() -> Bool {
        return true
    }
    
    func getDoctorUserpicImage() -> String {
        return "userpic_doctor_orteka.png"
    }
    
    func getColorForDutyDoctorTitle() -> UIColor {
        return secondColor()
    }
    
    func isShowPatientNameOnPayment() -> Bool {
        return false
    }
    
    func isBirthdayRequiredOnRegistration() -> Bool {
        return true
    }
    
    func isRegistrationAllowed() -> Bool {
        return true
    }
    
    func isShowMoney() -> Bool {
        return false
    }
    
    func getYandexMetricaId() -> String? {
        return nil
    }
    
    func getDoctorListTabBarIcon() -> String {
        return "specialist.png"
    }
    
    func getPartnerId() -> String {
        return "008" //43
//        return "077"
    }
    
    func isExternalAuthentication() -> Bool {
        return true
    }
    
    func isRequestRegistration() -> Bool {
        return true
    }
    
    func isHideDutyDoctors() -> Bool {
        return true
    }
    
    func isShowNavigationTabsWhenNotLoggedIn() -> Bool {
        return false
    }
    
    func isFamilySwitchedOn() -> Bool {
        return true
    }
}
