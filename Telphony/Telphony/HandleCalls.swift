//
//  HandleCalls.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import CoreTelephony
import CallKit
import CoreLocation
import PushKit

class HandleCalls: NSObject, CLLocationManagerDelegate, PKPushRegistryDelegate, CXProviderDelegate {

    let location = CLLocationManager()
    let callProvider: CXProvider
    let pushRegistry: PKPushRegistry
    
    override init() {
        let providerConfiguration = CXProviderConfiguration()
        self.callProvider = CXProvider(configuration: providerConfiguration)
        self.pushRegistry = PKPushRegistry(queue: .main)
        
        super.init()
        self.callProvider.setDelegate(self, queue: .main)
        self.pushRegistry.desiredPushTypes = [.voIP]
        self.pushRegistry.delegate = self
        self.location.delegate = self
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        print("[HandleCalls] push regsitry didUpdate")
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        print("[HandleCalls] provider did answer call: \(provider)")
        print("[HandleCalls] provider config: \(provider.configuration)")
        provider.setDelegate(self, queue: .main)
        
        action.fulfill()
    }
    
    func providerDidBegin(_ provider: CXProvider) {
        print("[HandleCalls] provider did being: \(provider)")
    }
    
    func providerDidReset(_ provider: CXProvider) {
        print("[HandleCalls] provider did reset: \(provider)")
    }
    
    func requestPermissions() {
        self.location.requestAlwaysAuthorization()
    }
}
