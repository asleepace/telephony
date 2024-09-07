//
//  Calls.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

// CallDirectoryHandler.swift

import Foundation
import CallKit

class CallDirectoryHandler: CXCallDirectoryProvider {

    override func beginRequest(with context: CXCallDirectoryExtensionContext) {
        context.delegate = self

        // Indicate that the extension is ready to handle calls
        context.completeRequest()
    }

    func reportIncomingCall(from number: CXCallDirectoryPhoneNumber, callerName: String) {
        // This method is called when an incoming call is received
        // You can use this to update your app's UI or perform any other actions
        print("Incoming call from \(callerName) (\(number))")
    }

    private func addAllBlockingPhoneNumbers(to context: CXCallDirectoryExtensionContext) {
        let phoneNumbers: [CXCallDirectoryPhoneNumber] = [ 14085555555, 18005555555 ]
        let labels = [ "Telemarketer", "Robocaller" ]

        for (phoneNumber, label) in zip(phoneNumbers, labels) {
            context.addBlockingEntry(withNextSequentialPhoneNumber: phoneNumber)
            print("Added blocking entry for \(label): \(phoneNumber)")
        }
    }

    private func addAllIdentificationPhoneNumbers(to context: CXCallDirectoryExtensionContext) {
        let phoneNumbers: [CXCallDirectoryPhoneNumber] = [ 18775555555, 18885555555 ]
        let labels = [ "My Bank", "Pizza Delivery" ]

        for (phoneNumber, label) in zip(phoneNumbers, labels) {
            context.addIdentificationEntry(withNextSequentialPhoneNumber: phoneNumber, label: label)
            print("Added identification entry for \(label): \(phoneNumber)")
        }
    }
}

extension CallDirectoryHandler: CXCallDirectoryExtensionContextDelegate {
    func requestFailed(for extensionContext: CXCallDirectoryExtensionContext, withError error: Error) {
        print("An error occurred: \(error)")
    }
}

// In your main app's ContentView.swift, add:

