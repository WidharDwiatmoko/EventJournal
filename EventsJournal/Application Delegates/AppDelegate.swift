//
//  AppDelegate.swift
//  EventsJournal
//
//  Created by waheedCodes on 03/09/2021.
//

import UIKit
import FirebaseCore
import FirebaseAnalytics
import FirebaseDynamicLinks
import AppTrackingTransparency
import AdSupport
import Branch

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var args = ProcessInfo.processInfo.arguments
        args.append("-FIRDebugEnabled")
        ProcessInfo.processInfo.setValue(args, forKey: "arguments")
        
        // Now that we are authorized we can get the IDFA
//        let tracker = GAI.sharedInstance().tracker(withTrackingId: "UA-192427551-5")
//        tracker?.allowIDFACollection = true
        
        FirebaseApp.configure()
        let branch: Branch = Branch.getInstance()
        branch.initSession(launchOptions: launchOptions, andRegisterDeepLinkHandler: {params, error in
            if error == nil{
                // params are the deep linked params associated with the link that the user clicked -> was re-directed to this app
                  // params will be empty if no data found
                  // Logic handling
                  print("params: %@", params as? [String: AnyObject] ?? {})
                
            }
        })

        
//        DispatchQueue.main.async {
//            requestPermission()
//        }
        
        
        
     
//        ATTrackingManager.requestTrackingAuthorization { status in
//            switch status {
//            case .authorized:
//                // Tracking authorization dialog was shown
//                // and we are authorized
//                print("Authorized")
//                //let tracker = GAI.sharedInstance()?.tracker(withTrackingId: "265589309")
//                //tracker?.allowIDFACollection = true
//                // Now that we are authorized we can get the IDFA
//                print("IDFA : \(ASIdentifierManager.shared().advertisingIdentifier)")
//            case .denied:
//                // Tracking authorization dialog was
//                // shown and permission is denied
//                print("Denied")
//            case .notDetermined:
//                // Tracking authorization dialog has not been shown
//                print("Not Determined")
//            case .restricted:
//                print("Restricted")
//            @unknown default:
//                print("Unknown")
//            }
//        }
        
        
        return true
    }
    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        requestPermission()
//    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        print("AppDelegate -> Received an url through a custom scheme: \(url.absoluteString)")
//        if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url) {
//            MainDelegate.handleIncomingDynamicLink(dynamicLink)
//            return true
//        } else {
//            // handle some other url, social media sign in or stuffs
//            return false
//        }
//
    //MARK: - For First time Install App
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        print("AppDelegate -> Received an url through a custom scheme: \(url.absoluteString)")
//        let strURL = URL(string: url.absoluteString)
//
//        let query = url.query ?? ""
//        let source = strURL?.valueOf("utm_source")
//        let medium = strURL?.valueOf("utm_medium")
//        let campaign = strURL?.valueOf("utm_campaign")
//        Analytics.logEvent("install_ios", parameters: [
//            "source" : "apple",
//            "medium" : medium,
//            "campaign" : campaign,
//        ])
//        return true

        if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url) {
            MainDelegate.handleIncomingDynamicLink(dynamicLink)
            return true
        } else {
            // handle some other url, social media sign in or stuffs
            return false
        }
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: "")
    }
    
    //MARK: - Handle Universal links for iOS < 13
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
           restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        //dllinks(userActivity)
        //return true
        
        if let incomingurl = userActivity.webpageURL {
            print("incoming URL is appdelegate \(incomingurl)")

            let linkhandled = DynamicLinks.dynamicLinks().handleUniversalLink(incomingurl) {(dynamicLink,error) in //error checking
                guard error == nil else
                {
                    print ("Found an Error! \(error!.localizedDescription)" )
                    return
                }
                if let dynamiclink = dynamicLink {
                    MainDelegate.handleIncomingDynamicLink(dynamiclink)
                }
            }
            if linkhandled{
                return true
            } else {
                // do something else with incoming url
                return false
            }
        }
        return false
    }
    
//    func application(_ application: UIApplication,
//                     configurationForConnecting connectingSceneSession: UISceneSession,
//                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

}
