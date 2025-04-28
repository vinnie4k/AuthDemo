//
//  ContentView.swift
//  AuthDemo
//
//  Created by Vin Bui on 4/28/25.
//

import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GoogleSignInButton {
                handleSignInButton()
            }
        }
    }

    // Ideally this should be in another file
    func handleSignInButton() {
        // 1. Get the key window scene
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("ERROR: Could not find active UIWindowScene.")
            return
        }

        // 2. Get the root view controller from the window scene
        guard let rootViewController = windowScene.windows.first?.rootViewController else {
            print("ERROR: Could not find root view controller.")
            return
        }

        // 3. Call the sign-in method with the presenting view controller
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController) { signInResult, error in // Pass the obtained rootViewController

                // 4. Handle the result
                guard let result = signInResult else {
                    // Inspect error - It's good practice to print the error
                    print("Error during sign in: \(error?.localizedDescription ?? "Unknown error")")
                    // TODO: Update UI to show an error message to the user
                    return
                }

                // 5. Sign in succeeded!
                print("Sign in successful!")
                print("User name: \(result.user.profile?.name ?? "N/A")")
                print("User email: \(result.user.profile?.email ?? "N/A")")

                // IMPORTANT: Get the ID Token to send to your backend
                if let idToken = result.user.idToken?.tokenString {
                    print("ID Token: \(idToken)")
                    // ---> !! Send this idToken to your backend server for verification !! <---
                    // TODO: Implement function to send token to your backend API
                } else {
                    print("Error: Could not retrieve ID Token.")
                    // TODO: Handle cases where the ID token might be missing
                }

                // TODO: Update your app's state to reflect logged-in status
                // e.g., navigate to the main part of your app
            }
    }
}

#Preview {
    ContentView()
}
