//
//  MainDelegate.swift
//  EventsJournal
//
//  Created by Widhar Dwiatmoko on 08/10/21.
//

import Foundation
import FirebaseDynamicLinks
import FirebaseAnalytics

struct MainDelegate {
    static func handleIncomingDynamicLink(_ dynamicLink: DynamicLink) {
        guard let url = dynamicLink.url else {
            print("MainDelegate -> Dynamic link object does not have url")
            return
        }
        let matchType = dynamicLink.matchType
        print("MainDelegate -> Your incoming link parameter is: \(url.absoluteString)")
        print("MainDelegate -> Match confidence: \(matchType.rawValue)")
        if matchType == .unique {
            print("MainDelegate -> Continuing to handle dynamic link parameters and send it to GA")
            
        }
    }
}
