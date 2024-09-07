//
//  IncomingCallObserver.swift
//  Telphony
//
//  Created by Colin Teahan on 9/7/24.
//

import CallKit

class IncomingCallObserver: NSObject, CXCallObserverDelegate, ObservableObject {
    
    let myCallObserver: CXCallObserver
    
    @Published var call: CXCall?
    @Published var status: String = "No active call"
    
    override init() {
        self.myCallObserver = CXCallObserver()
        super.init()
        self.myCallObserver.setDelegate(self, queue: .main)
    }
    
    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
        print("[IncomingCallObserver] observer: \(callObserver)")
        print("[IncomingCallObserver] call: \(call)")
        self.call = call
    }
}

