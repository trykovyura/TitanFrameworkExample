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

    func isHideRegistrationButton() -> Bool {
        return false
    }

    func isShowMakeAppointmentButton() -> Bool {
        return true
    }

    func isShowQueueNameInChat() -> Bool {
        return true
    }

    func isShowNewMessagesCountOnBadge() -> Bool {
        return true
    }

    func isShowConditionsInProfile() -> Bool {
        return true
    }

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
        return "userpic_doctor.png"
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
        return true
    }
    
    func getYandexMetricaId() -> String? {
        return nil
    }
    
    func getDoctorListTabBarIcon() -> String {
        return "specialist.png"
    }
    
    func getPartnerId() -> String {
        return "033" //43
//        return "077"
    }
    
    func isExternalAuthentication() -> Bool {
        return false
    }
    
    func isRequestRegistration() -> Bool {
        return false
    }
    
    func isHideDutyDoctors() -> Bool {
        return true
    }
    
    func isShowNavigationTabsWhenNotLoggedIn() -> Bool {
        return true
    }
    
    func isFamilySwitchedOn() -> Bool {
        return true
    }
    
    // Chat
    func getCallControllersColorFirst() -> UIColor {
        return UIColor(red:0.25, green:0.57, blue:0.25, alpha:1.0)
    }
    
    func getCallControllersColorSecond() -> UIColor {
        return .clear
    }
    
    func getHangupColor() -> UIColor {
        return UIColor(red:1.00, green:0.19, blue:0.19, alpha:1.0)
    }
    
    func getCallBackgroundColor() -> UIColor {
        return UIColor(red:0.30, green:0.30, blue:0.30, alpha:1.0)
    }
    
    func getIncomeBubbleColor() -> UIColor {
        return .white
    }
    
    func getOutcomeBubbleColor() -> UIColor {
        return UIColor(red:0.83, green:0.97, blue:0.83, alpha:1.0)
    }
    
    // Font
    func getRegularFontName() -> String {
        return "FiraSans-Regular"
    }
    
    func getMediumFontName() -> String {
        return "FiraSans-Medium"
    }
    
    func getBoldFontName() -> String {
        return "FiraSans-Bold"
    }

    func getEventServiceToken() -> String? {
        return nil
    }
}
