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
        return "logoVerticalDrclinics.png"
    }
    
    func getPrivacyURL() -> URL {
        return URL(string: "http://medline.doctor/privacy/")!
    }

    func getProductionServer() -> String {
        return "https://lk.medline.doctor"
    }
    
    func getSupportPhone() -> String {
        return "8 (800) 500-69-79"
    }
    

    func getImageLogoHeader() -> String {
        return "logoHeaderDrclinics.png"
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
        return "8db203dc-0bb4-43f5-9d51-1649317d212d"
    }

    func getDoctorListTabBarIcon() -> String {
        return "specialist.png"
    }

    func getPartnerId() -> String {
        return "002"
    }

    func isExternalAuthentication() -> Bool {
        return true
    }
}
