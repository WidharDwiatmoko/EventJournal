//
//  SceneDelegate.swift
//  EventsJournal
//
//  Created by waheedCodes on 03/09/2021.
//

import UIKit
import FirebaseDynamicLinks
import FirebaseAnalytics
import FirebaseCore
import AppTrackingTransparency
import AdSupport
import Branch

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinate: AppCoordinator?
    
    //MARK: - Handle universal link if app is closed or killed from system
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //FirebaseApp.configure()
        
//        if let userActivity = connectionOptions.userActivities.first, userActivity.activityType == NSUserActivityTypeBrowsingWeb {
//            if let incomingUrl = userActivity.webpageURL {
//                print("SceneDelegate -> My Incoming URL: \(incomingUrl)")
//                let linkHandled = DynamicLinks.dynamicLinks().handleUniversalLink(incomingUrl) { (dynamicLink, err) in
//                    if let err = err {
//                        print(err.localizedDescription)
//                        return
//                    }
//                    if let dynamicLink = dynamicLink {
//                        MainDelegate.handleIncomingDynamicLink(dynamicLink)
//                        Analytics.logEvent("screenView", parameters: [AnalyticsParameterScreenName: "ScreenName Native",
//                                                                     AnalyticsParameterScreenClass: "ScreenClass Native"])
//                    }
//                }
//                let query = incomingUrl.query ?? ""
//                let strURL = URL(string: incomingUrl.absoluteString)
//                let gclid = strURL?.valueOf("gclid")
//                let source = strURL?.valueOf("utm_source")
//                let medium = strURL?.valueOf("utm_medium")
//                let campaign = strURL?.valueOf("utm_campaign")
//
//
//                if linkHandled {
//                    print("SceneDelegate -> Dynamic link handeled")
//                }
//                //MARK: - If universal link (non-dynamic link) contains any "gclid"
//                else if query.contains("gclid"){
//                    Analytics.logEvent("custom_campaign_ios", parameters: [
//                        "source" : "google",
//                        "medium" : "cpc",
//                        "campaign" : "TestCampaign",
//                        "gclid" : gclid
//                    ])
//                //MARK: - If universal link (non-dynamic link) is not contains any "gclid"
//                }else {
//                    // do other stuff with other type of incoming url
//                    Analytics.logEvent("custom_campaign_ios", parameters: [
//                        "source" : source,
//                        "medium" : medium,
//                        "campaign" : campaign,
//                    ])
//                }
//            }
//        }
        
        
        
//        isAppAlreadyLaunchedOnce();
//        if let userActivity = connectionOptions.userActivities.first, userActivity.activityType == NSUserActivityTypeBrowsingWeb {
//            if let incomingUrl = userActivity.webpageURL {
//                print("SceneDelegate -> My Incoming URL: \(incomingUrl)")
//                let strURL = URL(string: incomingUrl.absoluteString)
//
//                let query = incomingUrl.query ?? ""
//                let source = strURL?.valueOf("utm_source")
//                let medium = strURL?.valueOf("utm_medium")
//                let campaign = strURL?.valueOf("utm_campaign")
//                Analytics.logEvent("campaign_details", parameters: [
//                    "source" : source,
//                    "medium" : medium,
//                    "campaign" : campaign,
//                ])
//
//                Analytics.logEvent("reengagement_ios", parameters: [
//                    "source" : source,
//                    "medium" : medium,
//                    "campaign" : campaign,
//                ])
//            }
//
//        }
        
//        if let userActivity = connectionOptions.userActivities.first {
//                debugPrint("userActivity: \(userActivity.webpageURL)")
//                fatalError()
//        }
//
        encryptMessage(message: "Sebastian Pramuda")
        encryptMessage(message: "085655558598")

        let encodedMessage = encryptMessage(message: "Sebastian Pramuda")
        let encodedMessage2 = encryptMessage(message: "085655558598")

        print("encode nama \(encodedMessage)")
        print("encode num \(encodedMessage2)")

        

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene
        self.window = window
        
        self.appCoordinate = AppCoordinator(window: window)
        appCoordinate?.start()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        
//        if let url = URLContexts.first?.url {
//            print("SceneDelegate -> Received an url through a custom scheme: \(url.absoluteString)")
//            if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url){
//                MainDelegate.handleIncomingDynamicLink(dynamicLink)
//                //return true
//            } else{
//                // maybe handel Google and firebase
//                print("False")
//            }
//            _ = DynamicLinks.dynamicLinks().handleUniversalLink(url) { (dynamicLinkr, error) in
//                guard error == nil else { return }
//                if let dynamicLink = dynamicLinkr {
//                    //your code for handling the dynamic link goes here
//                    MainDelegate.handleIncomingDynamicLink(dynamicLink)
//                }
//            }
//        }
        
        guard let first_url = URLContexts.first?.url else {
            return
        }
        print("SceneDelegate OpenURL -> \(first_url.absoluteString)")
        
//        let branchHandled = Branch.getInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        requestPermission()
    }

    //MARK: - Handle universal link if app is in the background
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {

//        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
//            myDelegate.application(UIApplication(), continue: userActivity) { dynamiclinks in
//                return
//            }
//
//        }
//    }
        
        
//        if let incomingUrl = userActivity.webpageURL {
//            print("SceneDelegate 2 -> My Incoming URL: \(incomingUrl)")
//            let linkHandled = DynamicLinks.dynamicLinks().handleUniversalLink(incomingUrl) { (dynamicLink, err) in
//                if let err = err {
//                    print(err.localizedDescription)
//                    return
//                }
//                if let dynamicLink = dynamicLink {
//                    MainDelegate.handleIncomingDynamicLink(dynamicLink)
//                    Analytics.logEvent("screenView", parameters: [AnalyticsParameterScreenName: "ScreenName Native",
//                                                                 AnalyticsParameterScreenClass: "ScreenClass Native"])
//                }
//            }
//            let query = incomingUrl.query ?? ""
//            let strURL = URL(string: incomingUrl.absoluteString)
//            let gclid = strURL?.valueOf("gclid")
//            let source = strURL?.valueOf("utm_source")
//            let medium = strURL?.valueOf("utm_medium")
//            let campaign = strURL?.valueOf("utm_campaign")
//
//            if linkHandled {
//                print("SceneDelegate 2 -> Dynamic link handeled")
//            }
//            else if query.contains("gclid"){
//                Analytics.logEvent("custom_campaign_ios", parameters: [
//                    "source" : "google",
//                    "medium" : "cpc",
//                    "campaign" : "TestCampaign",
//                    "gclid" : gclid
//                ])
//            }
//            else {
//                // do other stuff with other type of incoming url
//                Analytics.logEvent("custom_campaign_ios", parameters: [
//                    "source" : source,
//                    "medium" : medium,
//                    "campaign" : campaign,
//                ])
//            }
//        }

        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity.webpageURL,
              let components = URLComponents(url: url,
                                             resolvingAgainstBaseURL: true)
        else {
            return
        }
        print(components.queryItems)
        let strURL = URL(string: components.string ?? "")

        let query = components.query ?? ""
        let source = strURL?.valueOf("utm_source")
        let medium = strURL?.valueOf("utm_medium")
        let campaign = strURL?.valueOf("utm_campaign")
        Analytics.logEvent("campaign_details", parameters: [
            "source" : source,
            "medium" : medium,
            "campaign" : campaign,
        ])
        Analytics.logEvent("reengagement_ios", parameters: [
            "source" : source,
            "medium" : medium,
            "campaign" : campaign,
        ])

    }
}


extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}

func requestPermission() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // Now that we are authorized we can get the IDFA
//                    let tracker = GAI.sharedInstance().tracker(withTrackingId: "UA-192427551-5")
//                    tracker?.allowIDFACollection = true
                    // Tracking authorization dialog was shown
                    // and we are authorized
                    print("Authorized")
                    
                    print("IDFA : \(ASIdentifierManager.shared().advertisingIdentifier)")
                case .denied:
                    // Tracking authorization dialog was
                    // shown and permission is denied
                    print("Denied")
                    print("IDFA : \(ASIdentifierManager.shared().advertisingIdentifier)")
                case .notDetermined:
                    // Tracking authorization dialog has not been shown
                    print("Not Determined")
                case .restricted:
                    print("Restricted")
                @unknown default:
                    print("Unknown")
                }
            }
        }
    }
}

func isAppAlreadyLaunchedOnce() -> Bool {
    let defaults = UserDefaults.standard

    if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
        print("App already launched")
        return true
    } else {
        defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
        print("App launched first time")
        //Show your tutorial.
        return false
    }
}

func encryptMessage(message: String) -> String {
        let key = "zaWZUM0lDs5rsIgj!"
        var encryptedMessage = ""
        var keyIndex = 0
        
        for char in message {
            let charCode = char.asciiValue ?? 0
            let keyCharCode = key.utf8CString[keyIndex % key.utf8CString.count]
            
            // Encrypt each character using the corresponding key character
            var encryptedCharCode: UInt8
            if (charCode >= 32 && charCode <= 126) {
                encryptedCharCode = ((charCode - 32) + (UInt8(keyCharCode) - 32)) % 95 + 32
                encryptedMessage += String(UnicodeScalar(encryptedCharCode))
                keyIndex += 1
            } else {
                encryptedCharCode = charCode
                encryptedMessage += String(UnicodeScalar(encryptedCharCode))
            }
        }
        
        let encodedData = Data(encryptedMessage.utf8).base64EncodedString()
        return encodedData
    }

//encrypt example
//let encodedMessage = encryptMessage(message: "Sebastian Pramuda")
//print("encode message \(encodedMessage)")
