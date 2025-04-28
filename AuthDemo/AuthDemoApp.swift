//
//  AuthDemoApp.swift
//  AuthDemo
//
//  Created by Vin Bui on 4/28/25.
//

import GoogleSignIn
import SwiftUI

@main
struct AuthDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
