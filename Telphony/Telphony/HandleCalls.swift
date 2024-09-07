//
//  HandleCalls.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import CoreTelephony
import CallKit
import CoreLocation

class HandleCalls: NSObject, CLLocationManagerDelegate, CXProviderDelegate {

    let location = CLLocationManager()
    let callProvider: CXProvider
    
    override init() {
        var providerConfiguration = CXProviderConfiguration()
        self.callProvider = CXProvider(configuration: providerConfiguration)
        
        super.init()
        self.callProvider.setDelegate(self, queue: .main)
        self.location.delegate = self
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        print("[HandleCalls] provider did answer call: \(provider)")
        
        action.fulfill()
    }
    
    func providerDidReset(_ provider: CXProvider) {
        print("[HandleCalls] provider did reset: \(provider)")
    }
    
    func requestPermissions() {
        self.location.requestAlwaysAuthorization()
    }
}
